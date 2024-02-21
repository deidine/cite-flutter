import 'package:flutter/material.dart';



class Venue {
  final String name;
  final String address;
  final int capacity;
  final String description;

  Venue({
    required this.name,
    required this.address,
    required this.capacity,
    required this.description,
  });
}

 
class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late Venue selectedVenue= venues[0];
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final List<Venue> venues = [
    Venue(
      name: 'Venue A',
      address: '123 Main St',
      capacity: 100,
      description: 'A spacious venue with modern amenities.',
    ),
    Venue(
      name: 'Venue B',
      address: '456 Elm St',
      capacity: 50,
      description: 'An intimate venue perfect for small gatherings.',
    ), Venue(
      name: 'Venue B',
      address: '456 Elm St',
      capacity: 50,
      description: 'An intimate venue perfect for small gatherings.',
    ), Venue(
      name: 'Venue B',
      address: '456 Elm St',
      capacity: 50,
      description: 'An intimate venue perfect for small gatherings.',
    ), Venue(
      name: 'Venue B',
      address: '456 Elm St',
      capacity: 50,
      description: 'An intimate venue perfect for small gatherings.',
    ), Venue(
      name: 'Venue B',
      address: '456 Elm St',
      capacity: 50,
      description: 'An intimate venue perfect for small gatherings.',
    ), Venue(
      name: 'Venue B',
      address: '456 Elm St',
      capacity: 50,
      description: 'An intimate venue perfect for small gatherings.',
    ),
    // Add more venues as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Venue'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<Venue>(
              value: selectedVenue,
              items: venues.map((venue) {
                return DropdownMenuItem<Venue>(
                  value: venue,
                  child: Text(venue.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedVenue = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Venue',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Select Date:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      selectedDate = value;
                    });
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: selectedDate != null
                    ? Text(
                        '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                        style: TextStyle(fontSize: 18.0),
                      )
                    : Text(
                        'Select Date',
                        style: TextStyle(fontSize: 18.0),
                      ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Select Time:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            InkWell(
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      selectedTime = value;
                    });
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: selectedTime != null
                    ? Text(
                        '${selectedTime!.hour}:${selectedTime!.minute}',
                        style: TextStyle(fontSize: 18.0),
                      )
                    : Text(
                        'Select Time',
                        style: TextStyle(fontSize: 18.0),
                      ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (selectedVenue != null &&
                    selectedDate != null &&
                    selectedTime != null) {
                  // TODO: Implement booking logic here
                  print('Venue: ${selectedVenue.name}');
                  print('Date: ${selectedDate!.toString()}');
                  print('Time: ${selectedTime!.format(context)}');
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please select venue, date, and time.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}

