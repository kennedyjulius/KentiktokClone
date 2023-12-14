import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kentiktok_clone/controllers/upload_video_controller.dart';
import 'package:kentiktok_clone/views/widgets/mytext.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen(
      {super.key, required this.videoFile, required this.videoPath});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  final TextEditingController songController = TextEditingController();
  final TextEditingController captionController = TextEditingController();
  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(controller),
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextFormField(
                      controller: songController,
                      decoration: InputDecoration(
                          label: Text("Song Name"),
                          icon: Icon(Icons.music_note),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextFormField(
                      controller: captionController,
                      decoration: InputDecoration(
                          label: Text("Caption"),
                          icon: Icon(Icons.closed_caption),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () => uploadVideoController.uploadVideo(
                        songController.text,
                        captionController.text,
                        widget.videoPath),
                    child: MyText(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        size: 20,
                        text: "Share"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
