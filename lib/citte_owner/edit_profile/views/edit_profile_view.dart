import 'package:cite3/app/global_widgets/custom_white_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cite3/app/global_widgets/loading_spinkit.dart';
 
import '../controllers/edit_profile_controller.dart';
import '../widgets/edit_profile_builder.dart';

class EditProfileView extends GetView<EditProfileOwnerController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customWhiteAppBar('My Profile'),
      body: controller.obx(
        (state) => const EditProfileBuilder(),
        onLoading: const LoadingSpinkit(),
      ),
    );
  }
}
