import 'package:get/get.dart';

import '../controllers/home_owner_controller.dart';

class HomeOwnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeOwnerController>(
      () => HomeOwnerController(),
    );
  }
}
