import 'package:flutter/material.dart';
import 'package:kentiktok_clone/constants.dart';
import 'package:kentiktok_clone/views/widgets/mybutton.dart';
import 'package:kentiktok_clone/views/widgets/mytext.dart';
import 'package:kentiktok_clone/views/widgets/textinputfield.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
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
                  text: "Signup"),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 62,
                    backgroundImage: NetworkImage(
                        "https://plus.unsplash.com/premium_photo-1661573360939-b23a2cc0d312?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uJTIwb24lMjBwaG9uZXxlbnwwfHwwfHx8MA%3D%3D"),
                  ),
                  Positioned(
                      left: 80,
                      bottom: -10,
                      child: IconButton(
                          onPressed: () => authController.pickImage(),
                          icon: Icon(Icons.add_a_photo)))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextInput(
                labelText: 'Username',
                isobsecure: false,
                suffixIcon: Icon(Icons.clear),
                prefixIcon: Icons.person_2,
              ),
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
              TextInput(
                labelText: ' Confirm Password',
                isobsecure: true,
                suffixIcon: Icon(Icons.remove_red_eye),
                prefixIcon: Icons.lock,
              ),
              SizedBox(
                height: 20,
              ),
              MyButton(
                  ontap: () => authController.registerUser(
                        usernameController.text,
                        emailController.text,
                        passwordController.text,
                        authController.profilePhoto,
                      ),
                  text: "Register"),
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
                      text: "Already have an Account ?"),
                  TextButton(onPressed: () {}, child: Text("Login..."))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
