import 'dart:ffi';

import 'package:flutter/material.dart';

class WeekItem extends StatefulWidget {
  WeekItem({super.key});

  @override
  State<WeekItem> createState() => _WeekItemState();
}

class _WeekItemState extends State<WeekItem> {
  var selectedIndex = 0;

  List<Map<String, dynamic>> weekDays = [
    {
      'wk': 'SUN',
      'day': 1,
    },
    {
      'wk': 'MON',
      'day': 2,
    },
    {
      'wk': 'TUE',
      'day': 3,
    },
    {
      'wk': 'WED',
      'day': 4,
    },
    {
      'wk': 'THU',
      'day': 5,
    },
    {
      'wk': 'FRI',
      'day': 6,
    },
    {
      'wk': 'SAT',
      'day': 7,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weekDays.length,
          itemBuilder: (ctx, i) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = i;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      weekDays[i]['wk'],
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: i == selectedIndex
                          ? Colors.blue
                          : Colors.lightBlue[50],
                      child: Text(
                        weekDays[i]['day'].toString(),
                        style: TextStyle(
                            color: i == selectedIndex
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
