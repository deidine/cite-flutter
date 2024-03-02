import 'package:cite3/app/global/drawer_widget.dart';
import 'package:cite3/citte_owner/global/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cite3/app/global_widgets/custom_white_appbar.dart';
import 'package:cite3/app/global_widgets/loading_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/all_venue_controller.dart';
import '../widgets/all_venue_content_builder.dart';
import '../widgets/content_category_filter.dart';

class AllOwnerVenueView extends GetView<AllVenueOwnerController> {
  const AllOwnerVenueView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customWhiteAppBar('Explore'),
        drawer: GlobalDrawerOwner(),
        body: SmartRefresher(
            controller: controller.refreshController,
            onRefresh: controller.handleRefresh,
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              Center(
                child: controller.obx(
                  (state) {
                    if (controller.venues!.isEmpty) {
                      return Center(
                        child: Text('No venues available'),
                      );
                    } else {
                      return const SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            // ContentOfFilteredVenue(),
                            AllVenueContentBuilder(),
                          ],
                        ),
                      );
                    }
                  },
                  onLoading: const LoadingSpinkit(),
                ),
              )
            ])));
  }
}
