import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {

  List<Map<String, dynamic>> tileItems = [
    {
      'title': 'Notification',
      'subtitle': 'Check your Medicine notification',
      'icon': CupertinoIcons.bell
    },
    {
      'title': 'Sound',
      'subtitle': 'Ring,Silent, Vibrate',
      'icon': CupertinoIcons.speaker_1
    },
    {
      'title': 'Manage Your Account',
      'subtitle': 'Password, Email ID, Phone Number',
      'icon': CupertinoIcons.person
    },
    {
      'title': 'Notification',
      'subtitle': 'Check your Medicine notification',
      'icon': CupertinoIcons.bell
    },
    {
      'title': 'Notification',
      'subtitle': 'Check your Medicine notification',
      'icon': CupertinoIcons.bell
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
        List.generate(
          tileItems.length,
              (i) => ListTile(
            leading: Icon(
              tileItems[i]['icon'],
              size: 30,
              color: Colors.teal,
            ),
            title: Text(
              tileItems[i]['title'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              tileItems[i]['subtitle'],
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.teal,
                  wordSpacing: -1),
            ),
          ),
        )

    );
  }
}
