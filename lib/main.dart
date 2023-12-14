import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importing Get package

import 'package:kentiktok_clone/constants.dart';
import 'package:kentiktok_clone/controllers/auth_controller.dart';
import 'package:kentiktok_clone/views/screens/other_screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAXU6NXu67qpkC11NmM1KOp_DW7Wamx7Tc",
          authDomain: "kentiktokclone.firebaseapp.com",
          projectId: "kentiktokclone",
          storageBucket: "kentiktokclone.appspot.com",
          messagingSenderId: "16774339323",
          appId: "1:16774339323:web:f33c2255ed1faa984fee5e"),
    );
  }
  Get.put(AuthController());
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Remove const from here
  MyApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: HomeScreen(),
    );
  }
}
