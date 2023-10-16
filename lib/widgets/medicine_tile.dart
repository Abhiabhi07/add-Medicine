import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicineTile extends StatelessWidget {
  const MedicineTile(
      {super.key,
      required this.subtitle,
      required this.day,
      required this.trailingIconColor,
      required this.trailingText,
      required this.leadingIcon});

  final String subtitle;
  final int day;
  final Color trailingIconColor;
  final String trailingText;
  final Widget leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(12.0),
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: leadingIcon,
          title: Text(
            'Calpol 500mg Tablet',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          subtitle: Text(
            '$subtitle \t Day $day',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          trailing: Column(
            children: <Widget>[
              Icon(
                CupertinoIcons.bell,
                color: trailingIconColor,
              ),
              Text(trailingText)
            ],
          )),
    );
  }
}
