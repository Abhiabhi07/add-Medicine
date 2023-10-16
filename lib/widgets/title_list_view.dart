import 'package:flutter/material.dart';

import 'custom_text.dart';

class TitleListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: 'Compartment'),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 0,
              itemBuilder: (ctx, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.lightBlue[100]!, width: 1.0)),
                  height: 60,
                  width: 45,
                  margin: EdgeInsets.all(4),
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
