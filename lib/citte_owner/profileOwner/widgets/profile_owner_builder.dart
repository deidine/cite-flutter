import 'dart:convert';

import 'package:cite3/app/core/themes/font_themes.dart';
import 'package:cite3/app/core/values/colors.dart';
import 'package:cite3/app/global_widgets/custom_medium_button.dart';
import 'package:cite3/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
 
import '../controllers/profile_owner_controller.dart';

class ProfileBuilder extends GetView<ProfileOwnerController> {
  const ProfileBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: controller.refreshProfile,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            CircleAvatar(
              radius: 100,
              backgroundImage:AssetImage("assets/dp.jpg"),
            ),

               // CircleAvatar(
            //   radius: 100,
            //   backgroundImage: Image.memory(
            //     base64Decode(controller.userProfile.image),
            //   ).image,
            // ),
            const SizedBox(
              height: 15,
            ),
            Text(
              controller.userProfile!.name,
              style: profileTextStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              controller.userProfile!.email,
              style: subtitleProfileTextStyle,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomMediumButton(
              label: 'Edit Profile',
              onTap: () => Get.toNamed(Routes.EDIT_PROFILE),
              color: blue,
            ),
            SizedBox(
              width: double.infinity,
              height: Get.height * 0.1,
            ),
            // CustomMediumButton(
            //   label: 'Logout',
            //   onTap: () => Get.offAllNamed(Routes.LOGIN),
            //   color: red,
            // ),
          ],
        ),
      ),
    );
  }
}
