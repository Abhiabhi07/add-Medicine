import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';
import 'calendar.dart';
import 'week_item.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomText(
              title: 'Check History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.blue,
                  size: 30,
                ))
          ],
        ),
        Calendar(),
      ],
    );
  }
}
