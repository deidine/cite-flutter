import 'dart:convert';
import 'dart:io';

import 'package:cite3/app/core/values/colors.dart';
import 'package:cite3/app/global/pick_image.dart';
import 'package:cite3/app/global/text_field.dart';
import 'package:cite3/app/global/text_widget.dart';
import 'package:cite3/app/global_widgets/custom_medium_button.dart';
import 'package:cite3/app/global_widgets/loading_spinkit.dart';
import 'package:cite3/citte_owner/add_venue/controller/add_venue_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AddVenueView extends GetView<AddVenueController> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller.refreshController,
      onRefresh: controller.handleRefresh,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 20.0),
          Column(
            children: [
               CustomText(
                title: 'information cite',
                size: 16.0,
                color: Colors.black,
                weight: FontWeight.w500,
              ),
              const SizedBox(height: 20.0),
              const SizedBox(height: 20.0),
              CheckoutFormWidget(
                width: 1.0,
                label: 'le nom du cite',
                controller: controller.venueName,
                hintText: 'nom cite',
                isImp: true,
                textInputType: TextInputType.multiline,
                maxLines: 2,
                errorText: 'Field cannot be empty',
              ),
              const SizedBox(height: 10.0),
              CheckoutFormWidget(
                width: 1.0,
                label: 'prix par 15 min',
                controller: controller.pricePerHour,
                hintText: 'Prix ougiya',
                isImp: true,
                textInputType: TextInputType.number,
                maxLines: 1,
                errorText: 'Field cannot be empty',
              ),
              const SizedBox(height: 10.0),
              CheckoutFormWidget(
                width: 1.0,
                label: 'category',
                controller: controller.category,
                hintText: 'category',
                isImp: true,
                textInputType: TextInputType.multiline,
                maxLines: 1,
                errorText: 'Field cannot be empty',
              ),
              const SizedBox(height: 10.0),         
              CheckoutFormWidget(
                width: 1.0,
                label: 'localisation',
                controller: controller.location,
                hintText: 'adress du citte',
                isImp: true,
                textInputType: TextInputType.multiline,
                maxLines: 2,
                errorText: 'Field cannot be empty',
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                // Replace IconButton with GestureDetector
                onTap: () async {
                  final result = await selectPhoto();
                  File? imageFile = File(result.filePath);

                  if (imageFile != null) {
                    controller.image = imageFile;
                    // controller.update();

                    // controller.setImage(imageFile);
                  }
                },
                child: Column(
                  children: [
                    Icon(Icons.attach_file),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: controller.image != null
                            ? Image.file(
                                File(controller.image!.path),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 200, // Adjust the height as needed
                              )
                            : Container(
                                // Placeholder widget when image is null
                                width: double.infinity,
                                height: 200,
                                color: Colors.grey, // Placeholder color
                                child: Center(
                                  child: Text(
                                    'No Image Selected',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    //  Positioned(
                    // bottom: MediaQuery.of(context).size.height * 0.1 * 0.01,
                    // right: MediaQuery.of(context).size.height * 0.1 * 0.02,
                    // child: IconButton(
                    //   icon: const Icon(Icons.add_a_photo, size: 40
                    //       // size:  MediaQuery.of(context).size.height * 0.1 * 0.05,
                    //       ),
                    //   onPressed: () async {
                    //     final result = await selectPhoto();
                    //     File? imageFile = File(result.filePath);

                    //     if (imageFile != null) {
                    //       controller.image = imageFile;
                    //     }
                    //   },
                    // )),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              CustomMediumButton(
                label: 'Ajouter Cite',
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
            ],
          )
        ]),
      ),
    );
  }
}
