import 'package:cite3/app/global/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../global_widgets/custom_white_appbar.dart';
import '../../../global_widgets/loading_spinkit.dart';
import '../../../global_widgets/user_reservations/list_user_reservation_builder.dart';
import '../controllers/history_booking_controller.dart';

class HistoryBookingView extends GetView<HistoryBookingController> {
  const HistoryBookingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:GlobalDrawer(),

      appBar: customWhiteAppBar('Booking History'),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: controller.handleRefresh,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: controller.obx(
                (state) => ListUserReservationBuilder(
                  reservations: controller.bookedFieldsModel,
                  isUsingCustomActionButton: false,
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
