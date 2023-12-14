import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 30,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 250, 45, 108)),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 32, 211, 234)),
          ),
          Center(
            child: Container(
              height: double.infinity,
              width: 38,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(255, 250, 50, 108)),
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
