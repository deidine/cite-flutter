import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<String> availableSlots = [];

  @override
  void initState() {
    super.initState();
    fetchAvailableSlots();
  }

  Future<void> fetchAvailableSlots() async {
    try {
      final response = await http.get(Uri.parse('https://your-django-backend-url/api/available-slots/'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          availableSlots = List<String>.from(data['available_slots']);
        });
      } else {
        // Handle error response
        print('Failed to fetch available slots: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network error
      print('Failed to fetch available slots: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Slots'),
      ),
      body: ListView.builder(
        itemCount: availableSlots.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(availableSlots[index]),
            // Add onTap callback to book the selected slot
            onTap: () {
              // Implement booking logic here
              print('Booked slot: ${availableSlots[index]}');
            },
          );
        },
      ),
    );
  }
}



