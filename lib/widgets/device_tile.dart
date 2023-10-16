import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceTile extends StatefulWidget {
  DeviceTile({super.key});

  @override
  State<DeviceTile> createState() => _DeviceTileState();
}

class _DeviceTileState extends State<DeviceTile> {
  var selected = false;

  List<Map<String, dynamic>> tabTile = [
    {
      'title': 'Connect',
      'subtitle': 'Bluetooth,Wi-Fi',
      'isSelected' : false
    },
    {
      'title': 'Sound Option',
      'subtitle': 'Ring, Silent,Vibrate',
      'isSelected' : false
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
            color: Color(0xffEAEEFF),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
            children: List.generate(
          tabTile.length,
          (i) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: tabTile[i]['isSelected'] ? Colors.white : null),
            child: ListTile(
              onTap: () {
                setState(() {
                 tabTile[i]['isSelected'] = !tabTile[i]['isSelected'] ;
                  selected = !selected;
                });
              },
              leading: Icon(
                CupertinoIcons.speaker_1,
                size: 30,
                color: Colors.teal,
              ),
              title: Text(
                tabTile[i]['title'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                tabTile[i]['subtitle'],
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.teal,
                    wordSpacing: -1),
              ),
            ),
          ),
        )));
  }
}
// Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: Colors.white),
//               child: ListTile(
//                 onTap: (){
//                   setState(() {
//                     selected = !selected;
//                   });
//                 },
//                 leading: Icon(
//                   CupertinoIcons.speaker_1,
//                   size: 30,
//                   color: Colors.teal,
//                 ),
//                 title: Text(
//                   tabTile[i]['title'],
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 subtitle: Text(
//                   tabTile[i]['subtitle'],
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       color: Colors.teal,
//                       wordSpacing: -1),
//                 ),
//               ),
//             ),
