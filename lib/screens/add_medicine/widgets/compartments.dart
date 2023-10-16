import 'package:assignment/widgets/title_list_view.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class Compartments extends StatefulWidget {
  const Compartments({super.key, required this.currentIndex});
  final void Function(int index) currentIndex;

  @override
  State<Compartments> createState() => _CompartmentsState();
}

class _CompartmentsState extends State<Compartments> {



  var selectedIndex = 0;

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
              itemCount: 7,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    widget.currentIndex(index);
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: selectedIndex != index || selectedIndex == 3
                            ? Colors.white
                            : Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(
                            color: selectedIndex == index
                                ? Colors.lightBlue
                                : Colors.teal,
                            width: 1)),
                    height: 60,
                    width: 45,
                    margin: EdgeInsets.all(4),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
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
