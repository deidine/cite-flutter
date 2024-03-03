import 'package:cached_network_image/cached_network_image.dart';
import 'package:cite3/app/core/themes/font_themes.dart';
import 'package:cite3/app/core/values/colors.dart';
import 'package:cite3/app/data/model/venue/venue_response.dart';
import 'package:cite3/app/data/provider/api_provider.dart';
import 'package:cite3/app/helper/formatted_price.dart';
import 'package:cite3/citte_owner/all_booking/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/all_payment_controller.dart';

class AllVenueContentBuilder extends GetView<AllpaymentOwnerController> {
  const AllVenueContentBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 15, 0, 8),
          child: Text(
            'All Payments',
            style: smallText.copyWith(color: orange),
          ),
        ),
        ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.payments!.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => controller.toBookingFieldPage(
              controller.payments![index].pymId as VenueResponse,
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Expanded(
                          child: Image.network(
                            width: 150,
                            "${ApiProvider.imgPaym}${controller.payments![index].pymId}/",
                            fit: BoxFit.cover,
                          ),
                        )),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.payments![index].bankApp,
                          style: smallText,
                        ),
                        Text(
                          "${controller.payments![index].phone}",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.pin_drop_sharp,
                              color: blue,
                              size: 14,
                            ),
                            Text(controller.payments![index].solde.toString())
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.attach_money,
                              color: blue,
                              size: 14,
                            ),
                            Text(
                              'phone. ${getFormattedPrice(controller.payments![index].phone)}',
                              style: textfieldText.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        CustomActionButton(
                          backgroundColor: Colors.red,
                          borderColor: Colors.black,
                          textColor: Colors.white,
                          label: "delete",
                          onTap: () {
                            controller.deletedId =
                                controller.payments![index].pymId;
                            controller.handleDeleteBookingField();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
