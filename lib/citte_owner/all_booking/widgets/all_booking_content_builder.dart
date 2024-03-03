import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cite3/app/core/themes/font_themes.dart';
import 'package:cite3/app/core/values/colors.dart';
import 'package:cite3/app/helper/formatted_price.dart';
import 'package:cite3/citte_owner/all_booking/widgets/user_data.dart';

import '../controllers/all_booking_controller.dart';

class AllBookingContentBuilder extends GetView<AllBookingController> {
  const AllBookingContentBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(8, 15, 0, 8),
          child: Text(
            'All Booking',
            style: smallText.copyWith(color: orange),
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.bookings.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => controller.toBookingFieldPage(
                controller.bookings[index].userId!, controller.bookings[index]),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 4, // Added elevation for a lifted look
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: UserDataBuilder(
                        email: controller
                            .getDetailUser(controller.bookings[index].userId!)!
                            .email,
                        phoneNumber: controller
                            .getDetailUser(controller.bookings[index].userId!)!
                            .phoneNumber,
                        status: controller.bookings[index].status!, 
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow(
                            context,
                            icon: Icons.timer,
                            text:
                                "${controller.getDetailUser(controller.bookings[index].userId!)!.idUser} id",
                          ),
                          _buildDetailRow(
                            context,
                            icon: Icons.timer,
                            text:
                                "${controller.bookings[index].hours.toString()} min",
                          ),
                          _buildDetailRow(
                            context,
                            icon: Icons.date_range,
                            text:
                                "Date ${controller.bookings[index].bookingTime}",
                          ),
                          _buildDetailRow(
                            context,
                            icon: Icons.start,
                            text:
                                "Begin ${controller.bookings[index].beginTime}",
                          ),
                          _buildDetailRow(
                            context,
                            icon: Icons.fiber_manual_record_sharp,
                            text: "End ${controller.bookings[index].endTime}",
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: blue,
                                size: screenWidth * 0.03,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                'Rp. ${getFormattedPrice(controller.bookings[index].totalPrice)}',
                                style: textfieldText.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidth * 0.035,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Get.toNamed(Routes.BOOKING_DETAIL, arguments: arguments);
                        controller.send(controller.bookings[index].userId!,
                            controller.bookings[index]);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: green, // Background color
                        onPrimary: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // Border radius
                        ),
                      ),
                      child: Text('Press Me'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDetailRow(BuildContext context,
      {required IconData icon, required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            color: blue,
            size: MediaQuery.of(context).size.width * 0.04,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Text(text,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045)),
        ],
      ),
    );
  }
}
