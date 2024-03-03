import 'package:cite3/app/global_widgets/user_reservations/single_play_hour_builder.dart';
import 'package:flutter/material.dart';
 
import '../../core/values/colors.dart';
import '../../data/model/reservation/user_reservation_model.dart';
import '../../modules/active_booking/widgets/custom_action_button.dart';

class UserReservationFooterBuilder extends StatelessWidget {
  const UserReservationFooterBuilder({
    Key? key,
    required this.hours,
    required this.reservation,
    required this.isUsingCustomActionButton,
    this.paymentFunction,
    this.cancelFunction,
    required this.transactionId,
  }) : super(key: key);

  final int hours;
  final bool isUsingCustomActionButton;
  final void Function(String)? cancelFunction;
  final void Function(UserReservation)? paymentFunction;
  final int transactionId;
  final UserReservation reservation;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
                SinglePlayHourBuilder(
                  number: hours.toString(),
                ),
               
               
          const Spacer(
            flex: 1,
          ),
          isUsingCustomActionButton
              ? Row(
                  children: [
                    CustomActionButton(
                      backgroundColor: green,
                      borderColor: Colors.transparent,
                      label: 'Payer',
                      onTap: () => paymentFunction!(
                        reservation,
                      ),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomActionButton(
                      backgroundColor: red,
                      borderColor: Colors.transparent,
                      label: 'Cancel',
                      onTap: () => cancelFunction!(transactionId as String),
                      textColor: Colors.white,
                    ),
                  ],
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
