// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:collection/collection.dart';

// class Comment {
//   String username;
//   String comment;
//   String datePublished;
//   List likes;
//   String profilePhoto;
//   String uid;
//   String id;

//   Comment({
//     required this.username,
//     required this.comment,
//     required this.datePublished,
//     required this.likes,
//     required this.profilePhoto,
//     required this.uid,
//     required this.id,
//   });
// static Comment fromSnap(DocumentSnapshot snap) {
//   var snapshot = snap.data() as Map<String, dynamic>;
//   return Comment(
//       username: snapshot['username'],
//       comment: comment,
//       datePublished: datePublished ?? this.datePublished,
//       likes: likes ?? this.likes,
//       profilePhoto: profilePhoto ?? this.profilePhoto,
//       uid: uid ?? this.uid,
//       id: id ?? this.id,
//     );
// } 
//   }
