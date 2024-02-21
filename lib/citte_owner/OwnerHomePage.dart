import 'dart:core';
import 'package:cite3/citte_owner/providers/details.dart';
import 'package:provider/provider.dart';
import 'cutumChecBox.dart';
import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

String getDateTimeText(DateTime _dateTime) {
  String time =
      "Date: ${_dateTime.day}/${_dateTime.month}  Time: ${_dateTime.hour}:${_dateTime.minute}    ";
  return time;
}

const Color maingreen = Colors.green;

class OwnerHomePage extends StatefulWidget {
  const OwnerHomePage({Key? key}) : super(key: key);

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  DateTime opendatetime = DateTime.now();
  DateTime closedatetime = DateTime.now();
  String open = "Nill";
  String close = "Nill";
  String message = "Your Clinic/Hospital is CLOSE Currently";
  bool isLive = false;

  @override
  void initState() {
    super.initState();
    context.read<OwnerDetailsProvider>().getDoctordetails();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    DateTime now = DateTime.now();
    int millisecondsSinceEpoch = now.millisecondsSinceEpoch;
    DateTime dateTimeFromMilliseconds =
        DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Home Page",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'Dosis',
            ),
          ),
          centerTitle: true,
          backgroundColor: maingreen,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("Refresh"),
                  style: ElevatedButton.styleFrom(
                    shape: const BeveledRectangleBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          // Add your profile image here
                          SizedBox(height: size.height * 0.002),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.9,
                        child: Column(
                          children: [
                            // Add your profile details here
                            SizedBox(height: size.height * 0.01),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    color: maingreen,
                    shape: const RoundedRectangleBorder(),
                    child: SizedBox(
                      height: size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.library_books),
                          Text(
                            open,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red,
                    shape: const RoundedRectangleBorder(),
                    child: SizedBox(
                      height: size.height * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.apps_outage_outlined),
                          Text(
                            close,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Text(
                message,
                style: const TextStyle(color: Colors.blue),
              ),
              SingleChildScrollView(
                child: GestureDetector(
                  onTap: () async {
                    DateTime? _opendateTime = opendatetime;
                    DateTime? _closedateTime = closedatetime;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: size.height * 0.4,
                          child: Column(
                            children: [
                              Container(
                                color: maingreen,
                                child: Column(
                                  children: [
                                    SizedBox(height: size.height * 0.02),
                                    Text(
                                      "OPENING TIME :",
                                      style: TextStyle(
                                        fontSize: size.width * 0.05,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          _opendateTime =
                                              await showOmniDateTimePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                             firstDate: DateTime(1600)
                                                .subtract(const Duration(days: 3652)),
                                            lastDate: DateTime.now().add(
                                              const Duration(days: 3652),
                                            ),
                                            is24HourMode: false,
                                            isShowSeconds: false,
                                            minutesInterval: 1,
                                            secondsInterval: 1,
                                            isForce2Digits: true,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                            constraints: const BoxConstraints(
                                              maxWidth: 350,
                                              maxHeight: 650,
                                            ),
                                            transitionBuilder:
                                                (context, anim1, anim2, child) {
                                              return FadeTransition(
                                                opacity: anim1.drive(
                                                  Tween(
                                                    begin: 0,
                                                    end: 1,
                                                  ),
                                                ),
                                                child: child,
                                              );
                                            },
                                            transitionDuration:
                                                const Duration(milliseconds: 200),
                                            barrierDismissible: true,
                                          );

                                          setState(() {
                                            open = getDateTimeText(_opendateTime!);
                                          });
                                        },
                                        child: const Text("SET OPENING TIME"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.04),
                              Container(
                                color: Colors.orange,
                                child: Column(
                                  children: [
                                    SizedBox(height: size.height * 0.02),
                                    Text(
                                      "CLOSING TIME :",
                                      style: TextStyle(
                                        fontSize: size.width * 0.05,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          _closedateTime =
                                              await showOmniDateTimePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1600)
                                                .subtract(const Duration(days: 3652)),
                                            lastDate: DateTime.now().add(
                                              const Duration(days: 3652),
                                            ),
                                            is24HourMode: false,
                                            isShowSeconds: false,
                                            minutesInterval: 1,
                                            secondsInterval: 1,
                                            isForce2Digits: true,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                            constraints: const BoxConstraints(
                                              maxWidth: 350,
                                              maxHeight: 650,
                                            ),
                                            transitionBuilder:
                                                (context, anim1, anim2, child) {
                                              return FadeTransition(
                                                opacity: anim1.drive(
                                                  Tween(
                                                    begin: 0,
                                                    end: 1,
                                                  ),
                                                ),
                                                child: child,
                                              );
                                            },
                                            transitionDuration:
                                                const Duration(milliseconds: 200),
                                            barrierDismissible: true,
                                          );

                                          setState(() {
                                            close = getDateTimeText(_closedateTime!);
                                          });
                                        },
                                        child: const Text("SET CLOSING TIME"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              const IsLiveCheckBox(),
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              // Your logic for handling confirmation
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: maingreen,
                            ),
                            child: const Text(
                              "Confirm",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.orange,
                    shape: const RoundedRectangleBorder(),
                    child: SizedBox(
                      height: size.height * 0.05,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.timelapse_sharp),
                          Text(
                            "Schedule Appointments",
                            style: TextStyle(fontSize: size.width * 0.05),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              const Text("Scheduled Appointments"),
              // Add your scheduled appointments widget here
            ],
          ),
        ),
      ),
    );
  }
}
