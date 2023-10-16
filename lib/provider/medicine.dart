import 'package:flutter/material.dart';

class Medicine {
  Medicine({
    required this.compartment,
    required this.color,
    required this.type,
    required this.quantity,
    required this.totalCount,
    required this.startDate,
    required this.endDate,
    required this.frequencyOfDays,
    required this.timeADAy,
    required this.dose,
    required this.time,
  });

   final int compartment;
  final int color;
  final String type;
  final String quantity;
  final double totalCount;
  final DateTime startDate;
  final DateTime endDate;
  final String frequencyOfDays;
  final String timeADAy;
  final String dose;
  final String time;

  Map<String, dynamic> toJson() {
    return {
      'compartment': compartment,
      'color': color,
      'type': type,
      'quantity': quantity,
      'totalCount': totalCount,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'frequencyOfDays': frequencyOfDays,
      'timeADAy': timeADAy,
      'dose': dose,
      'time': time
    };
  }

  // Creates a Medicine instance from a Map<String, dynamic>
  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      compartment: json['compartment'] as int,
      color: json['color'] as int,
      type: json['type'] as String,
      quantity: json['quantity'] as String,
      totalCount: json['totalCount']! as double,
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      frequencyOfDays: json['frequencyOfDays'] as String,
      timeADAy: json['timeADAy'] as String,
      dose: json['dose'] as String,
      time: json['time'] as String,
    );
  }


}
