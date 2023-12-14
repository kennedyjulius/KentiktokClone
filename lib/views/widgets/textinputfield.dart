import 'package:flutter/material.dart';
import 'package:kentiktok_clone/constants.dart';

// ignore: must_be_immutable
class TextInput extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  final String labelText;
  final bool isobsecure;
  final IconData prefixIcon;
  final Widget suffixIcon;

  TextInput({
    super.key,
    required this.labelText,
    this.isobsecure = false,
    required this.suffixIcon,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: suffixIcon,
          prefixIcon: Icon(prefixIcon),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: borderColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.greenAccent,
              )),
        ),
        obscureText: isobsecure,
      ),
    );
  }
}
