import 'package:cite3/app/global/drawer_widget.dart';
import 'package:cite3/app/global_widgets/custom_white_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_owner_controller.dart';

class HomeOwnerView extends GetView<HomeOwnerController> {
  const HomeOwnerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
            drawer:GlobalDrawer(),

      body: SafeArea(
        child: PageView.builder(
          controller: controller.pageController,
          onPageChanged: controller.changePageBySlide,
          itemCount: controller.pages.length,
          itemBuilder: (context, index) => controller.pages[index],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.pageIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Active',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.account_circle),
            //   label: 'Profile',
            // ),
          ],
        ),
      ),
    );
  }
}
