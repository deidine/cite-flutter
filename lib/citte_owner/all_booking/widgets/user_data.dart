import 'package:cite3/app/core/values/colors.dart';
import 'package:cite3/app/data/model/reservation/user_reservation_model.dart';
import 'package:cite3/app/global_widgets/user_reservations/single_play_hour_builder.dart';
import 'package:cite3/citte_owner/all_booking/widgets/custom_action_button.dart';
import 'package:cite3/citte_owner/all_booking/widgets/custum_container.dart';
import 'package:flutter/material.dart';

class UserDataBuilder extends StatelessWidget {
  UserDataBuilder({
    Key? key,
    required this.email,
    required this.phoneNumber,
    required this.status,
  }) : super(key: key);

  final String email;
  final String phoneNumber;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          'Email:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          email,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Phone Number:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          phoneNumber,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(height: 16),
        CustomContainer(
          backgroundColor: status == 'valid' ? Colors.green : Colors.red,
          borderColor: Colors.black,
          textColor: Colors.white,
          label: status, 
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
