import 'package:flutter/material.dart';

class CareTakTile extends StatelessWidget {
  const CareTakTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xffEAEEFF),
            borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.fromLTRB(12.0, 20, 12.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              4,
              (index) => Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                          radius: 25,
                        ),
                        Text('Name')
                      ],
                    ),
                  ),),
        ));
  }
}
