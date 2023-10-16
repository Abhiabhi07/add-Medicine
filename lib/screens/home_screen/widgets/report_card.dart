import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class Report {
  Report({
    required this.numb,
    required this.title,
  });

  final String title;
  final int numb;
}

class ReportCard extends StatelessWidget {
  ReportCard({super.key});

  List<Report> reports = [
    Report(numb: 5, title: 'Total'),
    Report(numb: 3, title: 'Taken'),
    Report(numb: 1, title: 'Missed'),
    Report(numb: 1, title: 'Snoozed'),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: Colors.black,
      color: Color(0xffFFFFFF),
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
       borderRadius:  BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Today\'s Report',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                4,
                (index) => Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      CustomText(
                        title: reports[index].numb.toString(),
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        reports[index].title,
                        style: TextStyle(color: Colors.teal, fontSize: 13.0),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
