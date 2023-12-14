import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final FontWeight fontWeight;
  final Color color;
  final double size;
  final String text;
  const MyText(
      {super.key,
      required this.fontWeight,
      required this.color,
      required this.size,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
    );
  }
}
