import 'package:flutter/material.dart';

class CircularProgressBar extends StatelessWidget {
  // The value of the progress bar, from 0.0 to 1.0
  final double value;

  // The color of the background track
  final Color backgroundColor;

  // The color of the progress indicator
  final Color color;

  // The width of the progress indicator stroke
  final double strokeWidth;

  // The shape of the progress indicator stroke
  final StrokeCap strokeCap;

  // The constructor of the widget
  const CircularProgressBar({
    Key? key,
    required this.value,
    this.backgroundColor = Colors.lightGreen,
    this.color = Colors.blue,
    this.strokeWidth = 6.0,
    this.strokeCap = StrokeCap.round,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
      backgroundColor: backgroundColor,
      color: color,
      strokeWidth: strokeWidth,
      strokeCap: strokeCap,
    );
  }
}
