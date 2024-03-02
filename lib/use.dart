import 'package:cite3/citte_owner/all_venue/controllers/all_venue_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourWidget extends StatelessWidget {
  final AllVenueOwnerController controller = Get.find<AllVenueOwnerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Title'),
      ),
      body: controller.obx(
        (state) {
          if (controller.venues!.isEmpty) {
            return Center(
              child: Text('No venues available'),
            );
          } else {
            return ListView.builder(
              itemCount: controller.venues!.length,
              itemBuilder: (context, index) {
                final venue = controller.venues![index];
                return ListTile(
                  title: Text(venue.image),
                  // Add other ListTile properties as needed
                );
              },
            );
          }
        },
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error) {
          return Center(
            child: Text('Error occurred: $error'),
          );
        },
      ),
    );
  }
}
