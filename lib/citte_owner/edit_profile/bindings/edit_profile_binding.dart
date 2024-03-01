import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileOwnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileOwnerController>(
      () => EditProfileOwnerController(),
    );
  }
}
