// colors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:kentiktok_clone/controllers/auth_controller.dart';
import 'package:kentiktok_clone/views/screens/other_screens/add_video_screen.dart';
import 'package:kentiktok_clone/views/screens/other_screens/video_screen.dart';

 List<Widget> pages = [
  VideoScreen(),
  Text('Search Screen'),
  AddVideoScreen(),
  Text('Message Screen'),
  Text('Profile Screen'),
];

const backgroundColor = Colors.white;
var buttonColor = Colors.red;
const borderColor = Colors.grey;

//Firebase
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
//controller
var authController = AuthController.instance;
