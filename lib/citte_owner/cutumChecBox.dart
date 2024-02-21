// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'OwnerHomePage.dart';
import 'package:flutter/material.dart'; 
// import 'package:swasthya_setu/pages/signin_as_doctor.dart';

// ignore: must_be_immutable
class GetCheckBox extends StatefulWidget {
  bool? isName;
  String name;
  List specializations;
  GetCheckBox({
    Key? key,
    this.isName,
    required this.name,
    required this.specializations,
  }) : super(key: key);

  @override
  State<GetCheckBox> createState() => _GetCheckBoxState();
}

class _GetCheckBoxState extends State<GetCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.name),
        Checkbox(
            value: widget.isName,
            onChanged: (bool? value) {
              if (value == true) {
                widget.specializations.add(widget.name);
              } else if (value == false) {
                widget.specializations.remove(widget.name);
              }
              // print(widget.specializations);
              setState(() {
                widget.isName = value;
              });
            }),
      ],
    );
  }
}




class IsLiveCheckBox extends StatefulWidget {
  const IsLiveCheckBox({super.key});

  @override
  State<IsLiveCheckBox> createState() => _IsLiveCheckBoxState();
}

class _IsLiveCheckBoxState extends State<IsLiveCheckBox> {
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Row(children: [
                                  // Checkbox(
                                  //     value: isLive,
                                  //     onChanged: (bool? value) {
                                  //       setState(() {
                                  //         isLive = value;
                                  //         // print(isLive);
                                  //       });
                                      // }),
                                  const Text(
                                    "My Clinic will get Live \nat my scheduled time.",
                                    softWrap: true,
                                  ),
                                ]),
    );
  }
}