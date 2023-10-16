import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'medicine.dart';
import 'package:provider/provider.dart';

class Medicines with ChangeNotifier {
  final List<Medicine> _medicines = [];

  List<Medicine> get medicines {
    return [..._medicines];
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  void addMedicine(Medicine medicine) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .set(Medicine(
            compartment: medicine.compartment,
            color: medicine.color,
            type: medicine.type,
            quantity: medicine.quantity,
            totalCount: medicine.totalCount,
            endDate: medicine.endDate,
            frequencyOfDays: medicine.frequencyOfDays,
            timeADAy: medicine.timeADAy,
            dose: medicine.dose,
            time: medicine.time,
            startDate: medicine.startDate,
          ).toJson());
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    final newMedicine = Medicine(
      compartment: medicine.compartment,
      color: medicine.color,
      type: medicine.type,
      quantity: medicine.quantity,
      totalCount: medicine.totalCount,
      endDate: medicine.endDate,
      frequencyOfDays: medicine.frequencyOfDays,
      timeADAy: medicine.timeADAy,
      dose: medicine.dose,
      time: medicine.time,
      startDate: medicine.startDate,
    );
    _medicines.add(newMedicine);
  }
}
