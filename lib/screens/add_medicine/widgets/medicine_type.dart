import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class MedicineData {
  MedicineData({required this.title, required this.imgUrl});

  final String imgUrl;
  final String title;
}

class MedicineType extends StatefulWidget {
  const MedicineType({super.key, required this.medicineData});

  final void Function(String medicineData) medicineData;

  @override
  State<MedicineType> createState() => _MedicineTypeState();
}

class _MedicineTypeState extends State<MedicineType> {
  var selectedIndex = 0;

  List<MedicineData> medicines = [
    MedicineData(
        title: 'Tablet',
        imgUrl: 'https://cdn-icons-png.flaticon.com/128/807/807165.png'),
    MedicineData(
      title: 'Capsule',
      imgUrl: 'https://cdn-icons-png.flaticon.com/128/4818/4818266.png',
    ),
    MedicineData(
      title: 'Cream',
      imgUrl: 'https://cdn-icons-png.flaticon.com/128/2317/2317725.png',
    ),
    MedicineData(
      title: 'Liquid',
      imgUrl: 'https://cdn-icons-png.flaticon.com/128/4465/4465505.png',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        CustomText(title: 'Type'),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 130,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: medicines.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    widget.medicineData(medicines[index].imgUrl);
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: selectedIndex != index
                              ? Colors.white
                              : Colors.lightBlue[50],
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(
                              color: selectedIndex == index
                                  ? Colors.lightBlue
                                  : Colors.transparent,
                              width: 1),
                        ),
                        height: 100,
                        width: 80,
                        margin: EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Image.network(
                              medicines[index].imgUrl,
                            ),
                            Text(
                              medicines[index].title,
                              style:
                                  TextStyle(color: Colors.teal, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
