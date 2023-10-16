import 'package:flutter/material.dart';

import '../../../widgets/circular_progress_bar.dart';
import '../../../widgets/custom_text.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 130,
        width: double.infinity,
        child: Card(
          elevation: 2.0,
          shadowColor: Colors.black,
          color: Color(0xffFFFFFF),
          margin: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(title: 'Check Dashboard'),
                    Text(
                      'Here you will find everything related\nto your active and past medicines.',
                      style: TextStyle(fontSize: 14, color: Colors.teal),
                    ),
                  ],
                ),
                Container(
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightBlueAccent[100]),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressBar(
                        value: 0.2,
                        color: Colors.red,
                        strokeWidth: 5.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
