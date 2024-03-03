import 'package:cite3/app/data/model/user/user_response.dart';
import 'package:cite3/citte_owner/all_booking/controllers/all_booking_controller.dart';
import 'package:cite3/citte_owner/all_booking/widgets/user_data_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cite3/app/core/values/colors.dart';
import 'package:cite3/app/global_widgets/custom_white_appbar.dart';

class BookingDetailView extends GetView<AllBookingController> {
  BookingDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customWhiteAppBar(controller.getDetailUserEdit()!.phoneNumber),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        Center(
          child: Row(children: [
            SizedBox(width: 14),
            Expanded(
              flex: 2,
              child: UserDataDetailBuilder(
                email: controller.getDetailUserEdit()!.email,
                phoneNumber: controller.getDetailUserEdit()!.phoneNumber,
                status:  controller.getDetailBookingEdit()!.status == 'valid' ? 'invalid' : 'valid',
                onTap:  controller.handleSubmitBookingField,
              ),
            ),
            Text(
              controller.getDetailBookingEdit()!.hours.toString()!,
            ),
            SizedBox(width: 14),
          ]),
        )
      ]),

      // SizedBox(width: screenWidth * 0.04),]),

      // floatingActionButton: FloatingActionButton.extended(
      //   label: const Text(
      //     'Edit Booking',
      //     style: TextStyle(color: lightBlue),
      //   ),
      //   icon: const Icon(Icons.edit, color: Colors.white),
      //   backgroundColor: green,
      //   onPressed: controller.handleSubmitBookingField,
      // ),
      floatingActionButton:// Add some space between the FABs
          FloatingActionButton.extended(
            label: const Text(
              'Delete Booking',
              style: TextStyle(color: lightBlue),
            ),
            icon: const Icon(Icons.delete, color: Colors.white),
            backgroundColor: red,
            onPressed: controller.handleDeleteBookingField,
          ),
        
    );
  }
}
