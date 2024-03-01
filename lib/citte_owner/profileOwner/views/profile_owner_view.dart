import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cite3/app/global_widgets/custom_white_appbar.dart';
import 'package:cite3/app/global_widgets/loading_spinkit.dart';

import '../controllers/profile_owner_controller.dart';
import '../widgets/profile_owner_builder.dart';

class ProfileOwnerView extends GetView<ProfileOwnerController> {
  const ProfileOwnerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customWhiteAppBar('My Profile'),
      body: controller.obx(
        (state) => const ProfileBuilder(),
        onLoading: const LoadingSpinkit(),
      ),
    );
  }
}
