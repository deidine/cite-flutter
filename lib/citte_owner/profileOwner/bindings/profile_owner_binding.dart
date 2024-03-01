import 'package:get/get.dart';

import '../controllers/profile_owner_controller.dart';

class ProfileOwnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileOwnerController>(
      () => ProfileOwnerController(),
    );
  }
}
