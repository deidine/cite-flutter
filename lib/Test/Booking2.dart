import "package:flutter/material.dart";
class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<TimeOfDay> bookedTimeSlots = [
    TimeOfDay(hour: 10, minute: 0),
    TimeOfDay(hour: 13, minute: 0),
    TimeOfDay(hour: 16, minute: 0),
  ];

  TimeOfDay? selectedTime;

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
            Text(
              'Available Time Slots:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _buildTimeSlots(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (selectedTime != null) {
                  // TODO: Implement booking logic here
                  print('Selected Time: ${selectedTime!.format(context)}');
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please select a time slot.'),
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

  List<Widget> _buildTimeSlots() {
    List<Widget> widgets = [];
    for (int hour = 8; hour <= 18; hour++) {
      for (int minute = 0; minute < 60; minute += 30) {
        TimeOfDay time = TimeOfDay(hour: hour, minute: minute);
        bool isBooked = bookedTimeSlots.contains(time);
        widgets.add(
          InkWell(
            onTap: isBooked ? null : () => _selectTimeSlot(time),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: isBooked ? Colors.grey : Colors.green,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                time.format(context),
                style: TextStyle(
                  color: isBooked ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      }
    }
    return widgets;
  }

  void _selectTimeSlot(TimeOfDay time) {
    setState(() {
      selectedTime = time;
    });
  }
}