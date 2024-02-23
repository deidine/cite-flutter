import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cite3/app/core/values/colors.dart';
import 'package:cite3/app/global_widgets/custom_white_appbar.dart';
import '../../active_booking/widgets/custom_action_button.dart';
import '../controllers/booking_field_controller.dart';
import '../widgets/date_range_picker_builder.dart';
import '../widgets/time_range_picker_builder.dart';

class BookingFieldView extends GetView<BookingFieldController> {
  const BookingFieldView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customWhiteAppBar(controller.infoVenue.idVenue.toString()),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () => controller.refreshSchedule(false),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateRangePickerBuilder(
              calendarHeight: Get.height * 0.44,
              maxDate: controller.getMaxDateTimeCalendar(),
              minDate: controller.getCurrentDateTime(),
              onSelectionChanged: controller.handleUserDatePick,
              initialDate: controller.getCurrentDateTime(),
            ),
             
            Row(
                  children: [
                    CustomActionButton(
                      backgroundColor: blue,
                      borderColor: Colors.transparent,
                      label: 'Select Time',
                      onTap: () =>   controller.selectTime(), // Call function to show time picker
                      textColor: pink,
                    ),
                    const SizedBox(
                      width: 10,
                    ), 
                  
            Obx(() {
              // Use Obx widget to listen to changes in selected time
              final selectedTime = controller.selectedTime.value;
              return selectedTime != null 
                ? Text(
                    'Selected Time: ${selectedTime.hour}:${selectedTime.minute}',
                  )
                : Container();
            }),],),
            const TimeRangePickerBuilder(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Booking Field',style: TextStyle(color: lightBlue),),
        icon: const Icon(Icons.ads_click_outlined),
        
        backgroundColor: green,
        onPressed: controller.handleSubmitBookingField,
      ),
    );
  }
}
