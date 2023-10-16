import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class Quantity extends StatefulWidget {
  const Quantity({super.key, required this.currentQuantity});

  final void Function(String quantityy) currentQuantity;

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  List<String> pills = [
    'Take 1/2 Pill',
    'Take 1 Pill',
    'Take 2 Pill',
  ];

  var count = 0;

  @override
  Widget build(BuildContext context) {
    widget.currentQuantity(pills[count]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: 'Quantity'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(7.0)),
                child: CustomText(title: pills[count]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.circular(7.0)),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (count >= pills.length) {
                        count--;
                      }
                    });
                  },
                  icon: Icon(CupertinoIcons.minus)),
            ),
            Container(
              height: 40,
              width: 50,
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.circular(7.0)),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (count < pills.length - 1) {
                        count++;
                      }
                    });
                  },
                  icon: Icon(CupertinoIcons.add)),
            ),
          ],
        ),
      ],
    );
  }
}
