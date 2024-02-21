 
import 'package:flutter/foundation.dart';


class OwnerDetailsProvider extends ChangeNotifier {
  Map<String, dynamic>? _DoctorDetailsMap;
  Map<String, dynamic> get getDoctorDetailsMap =>
      _DoctorDetailsMap ??
      {
        "uid": 'null',
        "age": '--',
        "address": "Atar",
        "email": "xyz@gmail.com",
        "photoURL": 'null',
        "name": 'Loading...',
        "gender": 'Male/Female',
        "bio": 'Null',
        "qualification": "----",
        "password": "----",
        "specialization": [],
        "type": "---",
        "number": 'xxxxxxxxxx',
        "open": "Nill1",
        "close": "Nill1"
      };

  getDoctordetails() async {
    // FirebaseFirestore _firestore = FirebaseFirestore.instance;
    // final DoctorDetailsSnap = await _firestore
    //     .collection("Doctors")
    //     .doc(FirebaseAuth.instance.currentUser?.uid)
    //     .get();
    // _DoctorDetailsMap = DoctorDetailsSnap.data() as Map<String, dynamic>;
    notifyListeners();
  }
}