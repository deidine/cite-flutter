import 'dart:typed_data';
import 'package:cite3/app/data/enum/role_enum.dart';
import 'package:cite3/app/data/provider/dimens.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cite3/app/core/themes/font_themes.dart';
import 'package:cite3/app/core/values/colors.dart';
import 'package:cite3/app/global_widgets/custom_medium_button.dart';
import 'package:cite3/app/global_widgets/custom_textfield.dart';
import 'package:cite3/app/global_widgets/footer_text.dart';
import 'package:cite3/app/global_widgets/loading_spinkit.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/values/assets.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  Uint8List? _imagedp;

  String? dropDownvalue = item.first;
  RegisterView({Key? key}) : super(key: key);
  static List<String> item = ["Male", "Female"];

  List<CustomTextField> regiterFields() {
    return [
      CustomTextField(
        textStyle: textfieldText,
        controller: controller.fullNameController,
        icon: Icons.account_circle,
        label: 'Full Name',
        isObscure: false,
      ),
      CustomTextField(
        textStyle: textfieldText,
        controller: controller.addressController,
        icon: Icons.home,
        label: 'Address',
        isObscure: false,
      ),
      CustomTextField(
        textStyle: textfieldText,
        controller: controller.phoneNumberController,
        icon: Icons.phone,
        label: 'Phone Number',
        isObscure: false,
      ),
      CustomTextField(
        textStyle: textfieldText,
        controller: controller.emailController,
        icon: Icons.email,
        label: 'Email',
        isObscure: false,
      ),
      CustomTextField(
        textStyle: textfieldText,
        controller: controller.usernameController,
        icon: Icons.person,
        label: 'Username',
        isObscure: false,
      ),
      CustomTextField(
        textStyle: textfieldText,
        controller: controller.passwordController,
        icon: Icons.lock,
        label: 'Password',
        isObscure: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              heroRegisterImage,
              width: Get.width * 0.49,
            ),
            const SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Register',
                style: headline4,
              ),
            ),
           Stack(
  children: [
    _imagedp != null
      ? CircleAvatar(
          backgroundImage: MemoryImage(_imagedp!),
          radius: MediaQuery.of(context).size.height * 0.1,
        )
      : CircleAvatar(
          backgroundImage: const AssetImage("assets/dp.jpg"),
          // If you don't want to set radius when image is not available, you can remove it
          radius: 50,
        ),
    Positioned(
      bottom: MediaQuery.of(context).size.height * 0.1 * 0.01,
      right: MediaQuery.of(context).size.height * 0.1 * 0.02,
      child: IconButton(
        icon: const Icon(
          Icons.add_a_photo,
          size:40
          // size:  MediaQuery.of(context).size.height * 0.1 * 0.05,
        ),
        onPressed: () async {
          // Uint8List dp = await getImage(ImageSource.gallery);
          // _imagedp = dp;
        },
      ),
    ),
  ],
),

            DropdownButton<String>(
                autofocus: true,
                focusColor: Colors.grey.shade200,
                dropdownColor: Colors.grey.shade200,
                value: dropDownvalue,
                items: item.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  dropDownvalue = value;
                }),
            PopupMenuButton<Role>(
                icon: const Icon(
                  Icons.expand_more,
                ),
                onSelected: (Role selectedRole) {
                  controller.role.value = selectedRole;
                },
                itemBuilder: (context) => <PopupMenuItem<Role>>[
                      const PopupMenuItem<Role>(
                        value: Role.client,
                        child: Text('client'),
                      ),
                      const PopupMenuItem<Role>(
                        value: Role.owner,
                        child: Text('owner'),
                      ),
                    ]),
            Text("deidien ${controller.selectedRole.value.toString()}"),
            const SizedBox(
              height: 20,
            ),
            ...regiterFields()
                .map(
                  (field) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: field,
                  ),
                )
                .toList(),
            const SizedBox(
              height: 25,
            ),
            CustomMediumButton(
              label: 'Sign Up',
              onTap: controller.handleRegister,
              color: blue,
            ),
            SizedBox(
              height: 50,
              child: controller.obx(
                (state) => const SizedBox.shrink(),
                onLoading: const Center(
                  child: LoadingSpinkit(),
                ),
              ),
            ),
            FooterText(
              label: 'Already Registered? ',
              labelWithFunction: 'Login',
              ontap: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
