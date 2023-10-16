import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class ColoursList extends StatefulWidget {
  const ColoursList({super.key, required this.selectedColor});

  final void Function(int selectedColor) selectedColor;

  @override
  State<ColoursList> createState() => _ColoursListState();
}

class _ColoursListState extends State<ColoursList> {
  var selectedIndex = 0;

  List<int> colors = [
    0xffF9CEEE,
    0xffC1B6FF,
    0xffFF9696,
    0xffCEFBBE,
    0xffF9C290,
    0xffBAE6FF,
    0xffFFFAB2,

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        CustomText(title: 'Colour'),
        SizedBox(
          height: 60,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                    onTap: () {
                      widget.selectedColor(colors[index]);
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: selectedIndex == index
                                  ? Colors.blueAccent
                                  : Colors.teal,
                              width: 1.5)),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(colors[index]),
                      ),
                    ));
              }),
        ),
      ],
    );
  }
}
