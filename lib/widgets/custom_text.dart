import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, this.padding = false, required this.title, this.style});

  final bool padding;
  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding
          ? EdgeInsets.symmetric(vertical: 15)
          : EdgeInsets.zero,
      child: Text(
        title,
        style: style == null ? TextStyle(fontWeight: FontWeight.bold) : style,
      ),
    );
  }
}
