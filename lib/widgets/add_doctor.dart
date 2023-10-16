import 'package:flutter/material.dart';

class AddDoctor extends StatelessWidget {
  const AddDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
          color: Color(0xffEAEEFF),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(
                Icons.add_circle_outlined,
                size: 50,
                color: Colors.blue,
              )),
          Text(
            'Add Your Doctor',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          RichText(
            text: TextSpan(
                text: 'Or use ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: 'invite link',
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold))
                ]),
          )
        ],
      ),
    );
  }
}
