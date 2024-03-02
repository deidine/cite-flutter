import 'package:cite3/citte_owner/all_venue/controllers/all_venue_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourWidget extends  GetView<AllVenueOwnerController>  { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Title'),
      ),
      body: controller.obx(
        (state) {
           
            return ListView.builder(
              itemCount:2,
              itemBuilder: (context, index) {
                final venue = [];
                return ListTile(
                  title: Text('venue'),
                  // Add other ListTile properties as needed
                );
              },
            );
           
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
