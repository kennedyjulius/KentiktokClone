import 'package:flutter/material.dart';
import 'package:kentiktok_clone/constants.dart';
import 'package:kentiktok_clone/views/widgets/mytext.dart';

class MyButton extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  const MyButton({super.key, required this.ontap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: buttonColor,
      ),
      child: InkWell(
        onTap: ontap,
        child: Center(
          child: MyText(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            size: 20,
            text: text,
          ),
        ),
      ),
    );
  }
}
