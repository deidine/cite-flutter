import 'package:cached_network_image/cached_network_image.dart';
import 'package:cite3/app/data/provider/api_provider.dart';
import 'package:cite3/app/modules/all_venue/controllers/all_venue_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/themes/font_themes.dart';
import '../../data/model/reservation/user_reservation_model.dart';
import 'subtitle_user_reservation_builder.dart';
import 'user_reservation_booking_date_builder.dart';
import 'user_reservation_footer_builder.dart';
import 'user_reservation_image_builder.dart';
import 'user_reservation_price_information.dart';
import 'user_reservation_schedule_builder.dart';
import '../../helper/format_date_from_epoch_time.dart';
import '../../helper/formatted_price.dart';

class ListUserReservationBuilder extends StatelessWidget {
  final List<UserReservation> reservations;
  final bool isUsingCustomActionButton;

  final void Function(String)? cancelFunction;
  final void Function(UserReservation)? paymentFunction;

    ListUserReservationBuilder({
    Key? key,
    required this.reservations,
    required this.isUsingCustomActionButton,
    this.paymentFunction,
    this.cancelFunction,
  }) : super(key: key);
  final AllVenueController controller = Get.find<AllVenueController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: reservations.length,
      itemBuilder: (context, index) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
            childrenPadding: const EdgeInsets.all(8),
            textColor: Colors.black,
            title: Text(
              'Booking Id:${reservations[index].transactionId}',
              style: smallText,
            ),
            subtitle: SubtitleUserReservationBuilder(
              secondText: 'Rp. ${getFormattedPrice(
                reservations[index].totalPrice,
              )}',
              firstText: reservations[index].venueName,
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Expanded(
                          child:CachedNetworkImage(
                            width: 150,
                          imageUrl:  "${ApiProvider.imgVenue}${controller.venues![index].idVenue}/",
                            fit: BoxFit.cover,
                          ),
                        )),
              // UserReservationImageBuilder(url: reservations[index].imageLink),
              const SizedBox(
                height: 8,
              ),
              UserReservationBookingDateBuilder(
                date:  
                  reservations[index].bookingTime  ,
                
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Price',
                style: textfieldText.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              UserReservationPriceInformation(
                price: 'Rp. ${getFormattedPrice(
                  reservations[index].pricePerHour,
                )}',
              ),
              const SizedBox(
                height: 10,
              ),
         
              Text(
                'Schedule',
                style: textfieldText.copyWith(
                  fontWeight: FontWeight.w600,
                ),),
              const SizedBox(
                height: 4,
              ),
              UserReservationScheduleBuilder(
                date: 
                  reservations[index].playTime ,
               ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Play hours',
                style: textfieldText.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              UserReservationFooterBuilder(
                hours: reservations[index].hours,
                isUsingCustomActionButton: isUsingCustomActionButton,
                transactionId: reservations[index].transactionId,
                reservation: reservations[index],
                cancelFunction: cancelFunction,
                paymentFunction: paymentFunction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
