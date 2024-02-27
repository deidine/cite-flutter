import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cite3/app/global/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cite3/app/global_widgets/custom_white_appbar.dart';
import 'package:cite3/app/global_widgets/loading_spinkit.dart';

import '../controllers/all_booking_controller.dart';
import '../widgets/all_booking_content_builder.dart';

class AllBookingView extends GetView<AllBookingController> {
  const AllBookingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customWhiteAppBar('Explore'),
      drawer: GlobalDrawer(),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: controller.handleRefresh,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: controller.obx(
                (state) => const SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // HeaderCategoryVenueBuilder(),
                      // ContentOfFilteredVenue(),
                      AllBookingContentBuilder(),
                    ],
                  ),
                ),
                onLoading: const LoadingSpinkit(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}