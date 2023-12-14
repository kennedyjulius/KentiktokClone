// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  final String username;
  final String uid;
  final String id;
  final List<String> likes;
  final int commentCount;
  final int shareCount;
  final String songname;
  final String caption;
  final String videoUrl;
  final String thumbnail;
  final String profilePhoto;

  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songname,
    required this.caption,
    required this.videoUrl,
    required this.thumbnail,
    required this.profilePhoto,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'uid': uid,
      'id': id,
      'likes': likes,
      'commentCount': commentCount,
      'shareCount': shareCount,
      'songname': songname,
      'caption': caption,
      'videoUrl': videoUrl,
      'thumbnail': thumbnail,
      'profilePhoto': profilePhoto,
    };
  }

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Video(
      username: snapshot['username'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      likes: (snapshot['likes'] as List<dynamic>).map((like) => like.toString()).toList(),
      commentCount: snapshot['commentCount'],
      shareCount: snapshot['shareCount'],
      songname: snapshot['songname'],
      caption: snapshot['caption'],
      videoUrl: snapshot['videoUrl'],
      thumbnail: snapshot['thumbnail'],
      profilePhoto: snapshot['profilePhoto'],
    );
  }
}
