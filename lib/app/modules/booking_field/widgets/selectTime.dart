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

class SeletTime extends StatefulWidget {
    
  SeletTime( {Key? key,required this.hour }) : super(key: key);
    String hour;

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<SeletTime> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  
  String get hour => hour;
  
  set hour(String hour) {}

  @override
  Widget build(BuildContext context) {
    return   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
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
                  this.hour  =  '${selectedTime!.hour}:${selectedTime!.minute}';
                    String  selectedTime2 = this.hour;
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
          ],
        ) ;
  }

  String selectTime() {
    if (selectedTime != null) {
      // TODO: Implement booking logic here
      print('Time: ${selectedTime!.format(context)}');
      return selectedTime!.format(context);
    }
    return 'null';
  }
  String hr=selectedTime2 as String;
   String selectedTime2(){
    return hr;
  }
}
