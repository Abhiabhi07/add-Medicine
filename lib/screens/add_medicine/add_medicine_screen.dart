import 'dart:ffi';

import 'package:assignment/provider/medicine.dart';
import 'package:assignment/provider/medicines.dart';
import 'package:assignment/screens/add_medicine/widgets/compartments.dart';
import 'package:assignment/screens/add_medicine/widgets/quantity.dart';
import 'package:assignment/screens/bn.dart';
import 'package:assignment/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../home_screen/home_screen.dart';
import 'widgets/colours.dart';
import 'widgets/medicine_type.dart';
import 'widgets/total_count.dart';

class AddMedicine extends StatefulWidget {
  AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  var compartment = 0;

  var selectedTime = 0;
  var selectedDose = 0;

  var color = Colors.white60.value;

  var type = 'https://cdn-icons-png.flaticon.com/128/807/807165.png';

  var quantity = 'Take 1/2 Pill';

  var totalCount = 1.0;

  var endDate;

  var frequencyOfDays = 'Everyday';

  var timeADay = 'One Time';

  var dose = 'Dose 1';

  var time = 'Before Food';

  DateTime? startDate;

  List<String> days = [
    'Everyday',
    'Today',
    'Tomorrow',
  ];

  List<String> timesADayList = [
    'One Time',
    'Two Time',
    'Three Time',
  ];

  List<String> timeList = [
    'Before food',
    'After food',
    'Before sleep',
  ];

  var timeValue = 'One Time';

  Medicine newMedicine = Medicine(
      compartment: 0,
      color: 0,
      type: '',
      quantity: '',
      totalCount: 0,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      frequencyOfDays: '',
      timeADAy: '',
      dose: '',
      time: '');

  _endDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    ).then((value) => {
          if (value == null) {DateTime.now()},
          setState(() {
            endDate = value!;
          })
        });
  }

  _startDatePicked() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    ).then((value) => {
          if (value == null) {DateTime.now()},
          setState(() {
            startDate = value!;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    print(color);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text(
          'Add Medicine',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(6.0),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.teal, width: 1.0)),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(child: Text('Search Medicine Name')),
                    Icon(Icons.mic)
                  ],
                ),
              ),
              Compartments(
                currentIndex: (int index) {
                  compartment = index;
                },
              ),
              ColoursList(
                selectedColor: (int selectedColor) {
                  color = selectedColor;
                },
              ),
              MedicineType(
                medicineData: (medicineData) {
                  type = medicineData;
                },
              ),
              Quantity(currentQuantity: (qn) {
                quantity = qn;
              }),
              TotalCount(
                totalCount: (double count) {
                  totalCount = count;
                },
              ),
              CustomText(title: 'Set Date'),
              Row(
                mainAxisAlignment: MainAxisAlignment.sp7aceBetween,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _startDatePicked();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5.0),
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                            ),
                            borderRadius: BorderRadius.circular(7.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                title: startDate == null
                                    ? 'Today'
                                    : DateFormat.yMMMd().format(startDate!)),
                            Icon(
                              Icons.keyboard_arrow_right,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _endDate();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(5.0),
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                            ),
                            borderRadius: BorderRadius.circular(7.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                                title: endDate == null
                                    ? 'End Date'
                                    : DateFormat.yMMMd().format(endDate)),
                            Icon(
                              Icons.keyboard_arrow_right,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(title: 'Frequency of Days'),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(5.0),
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(7.0)),
                child: DropdownButton(
                    underline: Container(),
                    isExpanded: true,
                    value: frequencyOfDays,
                    items: days
                        .map((e) => DropdownMenuItem(
                              child: CustomText(title: e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        frequencyOfDays = newValue!;
                      });
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(title: 'How many times a Day'),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(5.0),
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(7.0)),
                child: DropdownButton(
                    underline: Container(),
                    isExpanded: true,
                    value: timeADay,
                    items: timesADayList
                        .map((e) => DropdownMenuItem(
                              child: CustomText(title: e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        timeADay = newValue!;
                      });
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                  children: List.generate(
                      3,
                      (index) => Column(
                            children: [
                              ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                tileColor: selectedDose == index ? Colors.lightBlueAccent : Colors.blue[50],
                                onTap: () {
                                  setState(() {
                                    selectedDose = index;
                                  });
                                  dose = 'Dose ${index + 1}';
                                },
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                leading: Icon(Icons.access_time_sharp),
                                title: Text('Dose ${index + 1}'),
                                trailing:
                                    Icon(Icons.keyboard_arrow_right_rounded),
                              ),
                              Divider(
                                indent: 10,
                                endIndent: 10,
                              ),
                            ],
                          ))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      timeList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ActionChip(
                          onPressed: () {
                            time = timeList[index];
                            setState(() {
                              selectedTime = index;
                            });
                          },
                          label: CustomText(title: timeList[index]),
                          shape: StadiumBorder(),
                          side: BorderSide.none,
                          backgroundColor: selectedTime == index
                              ? Colors.lightBlueAccent
                              : Colors.blue[50],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      if (startDate == null || endDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please select start and end date')));
                      }
                      newMedicine = Medicine(
                          compartment: compartment,
                          color: color,
                          type: type,
                          quantity: quantity,
                          totalCount: totalCount,
                          startDate: startDate!,
                          endDate: endDate,
                          frequencyOfDays: frequencyOfDays,
                          timeADAy: timeADay,
                          dose: dose,
                          time: time);
                      Provider.of<Medicines>(context, listen: false)
                          .addMedicine(newMedicine);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
