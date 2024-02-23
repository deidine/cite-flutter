import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cite3/app/core/values/assets.dart';
import 'package:cite3/app/core/values/strings.dart';
import 'package:cite3/app/routes/app_pages.dart';

import '../../../core/themes/font_themes.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_button.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(heroOnboardingImage),
                          const SizedBox(
                            width: double.infinity,
                            height: 40,
                          ),
                          Text(
                            onboardingText,
                            style: headline4,
                          ),
                          SizedBox(
                            height: Get.height * 0.15,
                          ),
                          OnBoardingButton(
                            function: () => Get.offAndToNamed(Routes.LOGIN,
                                arguments: false),
                          ),
                        ],
                      ),
                    ))),
          ]))
    ]));
  }
}
