import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDate = DateTime(2023);

  @override
  Widget build(BuildContext context) {
    return CalendarWeek(
      weekendsStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
      showMonth: false,
      height: 130,
      minDate: DateTime.now().add(
        Duration(days: -365),
      ),
      maxDate: DateTime.now().add(
        Duration(days: 365),
      ),
      onDatePressed: (DateTime datetime) {
        setState(() {
          _selectedDate = datetime;
        });
      },
      onDateLongPressed: (DateTime datetime) {
        setState(() {
          _selectedDate = datetime;
        });
      },

      dayOfWeekStyle:
          TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
      // dayOfWeekAlignment: FractionalOffset.bottomCenter,
      dateStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      // dateAlignment: FractionalOffset.topCenter,
      todayDateStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      todayBackgroundColor: Colors.lightBlue,
      pressedDateBackgroundColor: Colors.blue,
      pressedDateStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      dateBackgroundColor: Colors.lightBlue[50]!,
      backgroundColor: Colors.white,
      dayOfWeek: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
      //spaceBetweenLabelAndDate: 0,
      dayShapeBorder: BoxShape.circle,
      decorations: [
        DecorationItem(
          decorationAlignment: FractionalOffset.bottomRight,
          date: DateTime.now(),
        ),
        // DecorationItem(
        //     date: DateTime.now().add(Duration(days: 3)),
        //     decoration: Text(
        //       'Holiday',
        //       style: TextStyle(
        //         color: Colors.brown,
        //         fontWeight: FontWeight.w600,
        //       ),
        //     )),
      ],
    );
  }
}
