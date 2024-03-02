import 'package:cached_network_image/cached_network_image.dart';
import 'package:cite3/app/core/values/colors.dart';
import 'package:cite3/app/modules/home/controllers/home_controller.dart'; 
import 'package:cite3/app/modules/profile/controllers/profile_controller.dart';
import 'package:cite3/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'drwer_list.dart';
import 'text_widget.dart';

class GlobalDrawer   extends GetView<HomeController> {
    GlobalDrawer({super.key});
 
  double _turns = 0.0;
  @override
 Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      // color: blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),

                // ^Profile info if login
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ^Profile Picture

                    CircleAvatar(
                      maxRadius: 40.0,
                      backgroundColor: Colors.grey,
                      child: ClipOval(
                        child: SizedBox(
                          width: 140.0, // Set a fixed width and height
                          height: 140.0,
                          child: CachedNetworkImage(
                            imageUrl: 'https://shorturl.at/elV34',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    //
                    const SizedBox(height: 10.0),

                    // ^Name & Email

                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.white,
                      ),
                      child: ExpansionTile(
                        title:   Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //^ name

                            CustomText(
                              title:   controller.dataUser!.email ,
                              size: 18.0,
                              color: blue,
                              weight: FontWeight.bold,
                            ),

                            //^ email

                            CustomText(
                              title:   controller.dataUser!.name ,
                              size: 14.0,
                              color: blue,
                            ),
                          ],
                        ),

                        // ^trailing animation

                        trailing: AnimatedRotation(
                          turns: _turns,
                          duration: const Duration(milliseconds: 100),
                          child: const Icon(
                            Icons.arrow_right,
                            color: Colors.black87,
                          ),
                        ),
                        children: const [],
                        onExpansionChanged: (value) {
                        //   setState(() {
                        //     if (_turns == 0.0) {
                        //       _turns = 0.25;
                        //     } else {
                        //       _turns = 0.0;
                        //     }
                        //   });
                        },
                      ),
                    ),

                    // ^divider
                    const Divider(),
                  ],
                ),

                // ^divider
                Divider(),

                // ^HOME
                DrawerList(
                    icon: Icons.home_outlined, title: 'Home', onTap: () {
                      Get.toNamed(Routes.HOME);
                    }),

                // ^Profile
                DrawerList(
                  icon: Icons.person_outline,
                  title: 'Profile',
                  onTap: () {
                    Get.toNamed(Routes.PROFILE );

                  },
                ),

                // ^Find Jobs
                DrawerList(
                  icon: Icons.work_outline,
                  title: 'Find Jobs',
                  onTap: () {},
                ),

                // ^ Edit Profile
                // FirebaseAuth.instance.currentUser != null
                //     ? DrawerList(
                //         icon: Icons.edit,
                //         title: 'Edit Profile',
                //         onTap: () {
                //           navigateToPage(context, const PersonalInfo());
                //         },
                //       )
                //     : const SizedBox(),

                // ^ Upload product
                // DrawerList(
                //   onTap: () {
                //     navigateToPage(context, const UploadGuideline());
                //   },
                //   icon: Icons.upload_file,
                //   title: 'Upload Product',
                // ),

                // ^Wishlist
                const DrawerList(
                  icon: Icons.favorite_outline,
                  title: 'Wishlist',
                ),

                // ^Logout
                DrawerList(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () {
                    Get.offAllNamed(Routes.LOGIN);
                  },
                )
                // : DrawerList(
                //     icon: Icons.logout,
                //     title: 'Login',
                //     onTap: () {
                //       navigateToPage(context, const LoginPage());
                //     },
                //   ),
              ],
            )),
      ),
    ));
  }
}
