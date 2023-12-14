import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:kentiktok_clone/constants.dart';
import 'package:kentiktok_clone/models/video.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  Future<File?> _compressVideo(String videoPath) async {
    try {
      final compressedVideo = await VideoCompress.compressVideo(
        videoPath,
        quality: VideoQuality.MediumQuality,
      );
      return compressedVideo?.file;
    } catch (e) {
      //print("Error compressing video: $e");
      Get.snackbar("Error Compressing video ", "$e");
      return null;
    }
  }

  Future<String?> _uploadVideoToStorage(String id, String videoPath) async {
    try {
      File? compressedVideo = await _compressVideo(videoPath);
      if (compressedVideo == null) {
        return null;
      }

      Reference ref = firebaseStorage.ref().child('videos').child(id);
      UploadTask uploadTask = ref.putFile(compressedVideo);
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading video: $e");
      return null;
    }
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  // Upload video
  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      // ignore: unused_local_variable
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();

      // Get id
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;
      // ignore: unused_local_variable
      String? videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      // ignore: unused_local_variable
      String thumbnail = await _uploadImageToStorage("Video $len", videoPath);
      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: "Video $len",
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songname: songName,
        caption: caption,
        videoUrl: videoUrl ?? '',
        thumbnail: thumbnail,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['name'],
      );

      await firestore.collection('videos').doc('Video $len').set(
            video.toJson(),
          );
      Get.back();

      String? downloadUrl =
          await _uploadVideoToStorage("video $len", videoPath);

      if (downloadUrl != null) {}
    } catch (e) {
      //print("Error uploading video: $e");
      Get.snackbar("Error Uploading video", e.toString());
    }
  }
}
