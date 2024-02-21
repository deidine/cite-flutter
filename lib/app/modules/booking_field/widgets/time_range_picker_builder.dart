import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cite3/app/modules/booking_field/widgets/selected_time_picker_builder.dart';
import 'package:cite3/app/modules/booking_field/widgets/unselected_time_picker_builder.dart';

import '../../../core/themes/font_themes.dart';
import '../../../core/values/colors.dart';
import '../controllers/booking_field_controller.dart';

class TimeRangePickerBuilder extends GetView<BookingFieldController> {
  const TimeRangePickerBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Time',
            style: mediumText.copyWith(color: blue),
          ),
        ),
      GridView.builder(
  physics: const NeverScrollableScrollPhysics(),
  padding: const EdgeInsets.all(8),
  shrinkWrap: true,
  semanticChildCount: 3,
  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: Get.width / 6,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),
  itemCount: 5, // Since we want 2 rows for 15 to 30 and then add 15
  itemBuilder: (context, index) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: Get.width / 6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 3, // Since we want 3 columns for each row
      itemBuilder: (context, innerIndex) {
        final workingHour = index * 15 + innerIndex + 15;
        return Obx(
          () => controller.temporaryHours.contains(workingHour)
              ? SelectedTime(
                  hour: workingHour.toString(),
                  onTap: () => controller.handleUserTimePick(workingHour),
                )
              : UnselectedTime(
                  hour: workingHour.toString(),
                  onTap: () => controller.handleUserTimePick(workingHour),
                ),
        );
      },
    );
  },
),],
    );
  }
}



























// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cite3/app/modules/booking_field/widgets/selected_time_picker_builder.dart';
// import 'package:cite3/app/modules/booking_field/widgets/unselected_time_picker_builder.dart';

// import '../../../core/themes/font_themes.dart';
// import '../../../core/values/colors.dart';
// import '../controllers/booking_field_controller.dart';

// class TimeRangePickerBuilder extends GetView<BookingFieldController> {
//   const TimeRangePickerBuilder({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             'Time',
//             style: mediumText.copyWith(color: blue),
//           ),
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: List.generate(
//               24,
//               (index) {
//                 final workingHour = index + 1;
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                   child: Obx(
//                     () => GestureDetector(
//                       onTap: () =>
//                           controller.handleUserTimePick(workingHour),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: controller.temporaryHours.contains(workingHour)
//                               ? Color.fromARGB(255, 27, 5, 226).withOpacity(0.8)
//                               :  Colors.grey,
//                         ),
//                         padding: const EdgeInsets.all(16),
//                         child: Text(
//                           workingHour.toString(),
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }



