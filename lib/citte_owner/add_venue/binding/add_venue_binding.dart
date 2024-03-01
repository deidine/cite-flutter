import 'package:cite3/citte_owner/add_venue/controller/add_venue_controller.dart';
import 'package:get/get.dart';


class AddVenueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddVenueController>(
      () => AddVenueController(),
    );
  }
}
