import 'package:flutter/material.dart';

class UserDataDetailBuilder extends StatelessWidget {
  UserDataDetailBuilder({
    Key? key,
    required this.email,
    required this.phoneNumber,
    required this.status,
    required this.onTap,
  }) : super(key: key);

  final String email;
  final String phoneNumber;
  final String status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Text(
              "Change the booking",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 8),
            Container( // Wrap ElevatedButton in Container for separation
              width: double.infinity, // Make button width match parent
              padding: EdgeInsets.symmetric(vertical: 8), // Add vertical padding
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  primary: status == 'valid' ? Colors.green : Colors.red,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(status),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
