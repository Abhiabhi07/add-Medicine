import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class TotalCount extends StatefulWidget {
  const TotalCount({super.key, required this.totalCount});

  final void Function(double count) totalCount;

  @override
  State<TotalCount> createState() => _TotalCountState();
}


class _TotalCountState extends State<TotalCount> {

  var startValue = 01;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [CustomText(title: 'Total Count'), Text('01')],
          ),
        ),
        Slider(
            min: 0,
            max: 100,
            value: startValue.toDouble(), onChanged: (v) {
              widget.totalCount(v);
          setState(() {
            startValue = v.round();
          });
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [CustomText(title: startValue.toString()), Text('100')],
        ),
      ],
    );
  }
}
