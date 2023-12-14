import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kentiktok_clone/constants.dart';
import 'package:kentiktok_clone/views/screens/other_screens/confirm_screen.dart';
import 'package:kentiktok_clone/views/widgets/mytext.dart';

class AddVideoScreen extends StatefulWidget {
  AddVideoScreen({super.key});

  pickImage(ImageSource source, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: source);
    if (video != null) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ConfirmScreen(
          videoFile: File(video.path),
          videoPath: video.path,
        ),
      ));
    }
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          //Gallery option
          SimpleDialogOption(
            onPressed: () => pickImage(ImageSource.gallery, context),
            child: Row(
              children: [
                Icon(Icons.image),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyText(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    size: 20,
                    text: "Gallery",
                  ),
                ),
              ],
            ),
          ),
          //cammera dialog option
          SimpleDialogOption(
            onPressed: () => pickImage(ImageSource.camera, context),
            child: Row(
              children: [
                Icon(Icons.camera),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyText(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    size: 20,
                    text: "Camera",
                  ),
                ),
              ],
            ),
          ),
          //Cancel option

          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(),
            child: Row(
              children: [
                Icon(Icons.clear),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyText(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    size: 20,
                    text: "Cancel",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => widget.showOptionsDialog(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: Center(
              child: MyText(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                size: 20,
                text: "Add Video",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
