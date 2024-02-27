import 'package:get/get.dart';

import '../controllers/all_booking_controller.dart';

class AllBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllBookingController>(
      () => AllBookingController(),
    );
  }
}
