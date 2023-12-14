import 'package:flutter/material.dart';
import 'package:kentiktok_clone/constants.dart';
import 'package:kentiktok_clone/views/widgets/mybutton.dart';
import 'package:kentiktok_clone/views/widgets/mytext.dart';
import 'package:kentiktok_clone/views/widgets/textinputfield.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            MyText(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                size: 30,
                text: "Tik Tok Clone"),
            MyText(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                size: 23,
                text: "Log in"),
            SizedBox(
              height: 20,
            ),
            TextInput(
              labelText: 'Email',
              isobsecure: false,
              suffixIcon: Icon(Icons.clear),
              prefixIcon: Icons.email,
            ),
            SizedBox(
              height: 20,
            ),
            TextInput(
              labelText: 'Password',
              isobsecure: true,
              suffixIcon: Icon(Icons.remove_red_eye),
              prefixIcon: Icons.lock,
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
                ontap: () => authController.loginUser(
                    emailController.text, passwordController.text),
                text: "Log in"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    size: 16,
                    text: "Dont have an Account ?"),
                TextButton(onPressed: () {}, child: Text("Register..."))
              ],
            )
          ],
        ),
      ),
    );
  }
}
