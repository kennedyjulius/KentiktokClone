import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kentiktok_clone/constants.dart';
import 'package:kentiktok_clone/models/user.dart' as model;
import 'package:kentiktok_clone/views/screens/auth/login_screen.dart';
import 'package:kentiktok_clone/views/screens/other_screens/home_screen.dart';

class AuthController extends GetxController {
  Rx<File?> _pickedImage = Rx<File?>(null);
  Rx<User?> _user = Rx<User?>(null);

  static var instance;
  File? get profilePhoto => _pickedImage.value;

  final ImagePicker _imagePicker = ImagePicker();

  AuthController() {
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  void pickImage() async {
    final pickImageResult =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickImageResult != null) {
      Get.snackbar("Profile Picture",
          "You have successfully selected your profile picture");
      _pickedImage.value = File(pickImageResult.path);
    }
  }

  Future<String> _uploadToStorage(File image) async {
    try {
      final ref = firebaseStorage
          .ref()
          .child('profilePics')
          .child(firebaseAuth.currentUser!.uid);
      final uploadTask = ref.putFile(image);
      final snap = await uploadTask;
      final downloadUrl = await snap.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw "Error uploading image to storage: $e";
    }
  }

  Future<void> registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        final cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        final downloadUrl = await _uploadToStorage(image);
        final user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        throw "Please enter all the fields";
      }
    } catch (e) {
      Get.snackbar("Error creating account", e.toString());
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar("Login message", "login successful");
      } else {
        throw "Please enter all the fields";
      }
    } catch (e) {
      Get.snackbar("Error logging in", e.toString());
    }
  }
}
