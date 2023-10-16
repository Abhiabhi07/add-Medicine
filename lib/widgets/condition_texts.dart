import 'package:assignment/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ConditionTexts extends StatelessWidget {
   ConditionTexts({super.key});

  List<String> titles = [
    'Privacy Policy',
    'Terms of Use',
    'Rate Us',
    'Share',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          titles.length, (index) => CustomText(title: titles[index], padding: true,)),
    );
  }
}
