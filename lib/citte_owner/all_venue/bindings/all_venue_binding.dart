import 'package:get/get.dart';

import '../controllers/all_venue_controller.dart';

class AllVenueOwnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllVenueOwnerController>(
      () => AllVenueOwnerController(),
    );
  }
}
