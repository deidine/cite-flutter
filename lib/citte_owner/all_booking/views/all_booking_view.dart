import 'package:cite3/app/data/service/booking_service.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cite3/app/global/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cite3/app/global_widgets/custom_white_appbar.dart';
import 'package:cite3/app/global_widgets/loading_spinkit.dart';

import '../controllers/all_booking_controller.dart';
import '../widgets/all_booking_content_builder.dart';

class AllBookingView extends GetView<AllBookingController> {
  AllBookingView({Key? key}) : super(key: key);
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customWhiteAppBar('Explore'),
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            // When the user submits the search query, send it to the backend
            BookingService.searchReservationListByDate(value);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // When the search icon is tapped, send the search query to the backend
              String query = _searchController.text;
              BookingService.searchReservationListByDate(query);
            },
          ),
        ],
      ),
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
