import 'package:cite3/app/global/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cite3/app/global_widgets/custom_white_appbar.dart';
import 'package:cite3/app/global_widgets/loading_spinkit.dart';

import '../controllers/all_venue_controller.dart';
import '../widgets/all_venue_content_builder.dart';
import '../widgets/content_category_filter.dart';
import '../widgets/header_category_filter.dart';

class AllOwnerVenueView extends GetView<AllVenueOwnerController> {
  const AllOwnerVenueView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customWhiteAppBar('Explore'),
      drawer:GlobalDrawer(),

      body: controller.obx(
        (state) =>   SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HeaderCategoryVenueBuilder(),
              ContentOfFilteredVenue(),
              AllVenueContentBuilder(),
             
            ],
          ),
        ),
        onLoading: const LoadingSpinkit(),
      ),
    );
  }
}
