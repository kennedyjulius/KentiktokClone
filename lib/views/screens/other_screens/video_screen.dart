import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kentiktok_clone/constants.dart';
import 'package:kentiktok_clone/controllers/video_controller.dart';
import 'package:kentiktok_clone/views/screens/other_screens/comment_screen.dart';
import 'package:kentiktok_clone/views/widgets/circle_animation.dart';
import 'package:kentiktok_clone/views/widgets/mytext.dart';
import 'package:kentiktok_clone/views/widgets/video_player_item.dart';

class VideoScreen extends StatelessWidget {
   VideoScreen({super.key});
  final VideoController videoController = Get.put(VideoController());

  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 50,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            child: Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  profilePhoto,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //buildMusic function
  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.grey,
                Colors.white,
              ]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(profilePhoto),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() {
          return PageView.builder(
            itemCount: 0,
            controller: PageController(initialPage: 0, viewportFraction: 1.0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final data = videoController.videoList[index];
              return Stack(
                children: [
                  VideoPlayerItem(
                      videoUrl: videoController.videoList[index].videoUrl),
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //username text
                              MyText(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  size: 20,
                                  text: "Username"),
                              //Caption text
                              MyText(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  size: 16,
                                  text: "Caption"),
                              //a row containing music icon
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.music_note,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  //text
                                  MyText(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      size: 15,
                                      text: "Song Name"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      //another container
                      Container(
                        width: 100,
                        margin: EdgeInsets.only(top: size.height / 5),
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //profile photo on a cliprect + its function
                            buildProfile('String url'),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () => videoController.likeVideo(data.id),
                                  child:  Icon(
                                    Icons.favorite,
                                    size: 40,
                                    color: data.likes.
                                    contains(authController.user.uid) ?
                                    Colors.red : Colors.white,
                                  ),
                                ),
                                MyText(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    size: 16,
                                    text: "2,200 likes"),
                                SizedBox(
                                  height: 10,
                                ),
          
                                //Another Icon containing
                                InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => 
                                    CommentScreen(id: data.id,)
                                    ,)),
                                  child: Icon(
                                    Icons.comment,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                ),
                                MyText(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    size: 16,
                                    text: "2"),
                                SizedBox(
                                  height: 10,
                                ),
          
                                //Another Icon
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.share,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                ),
                                MyText(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    size: 16,
                                    text: "0"),
                                SizedBox(
                                  height: 10,
                                ),
          
                                //Circle Animation
                                CircleAnimation(
                                  child: buildMusicAlbum('profile photo'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          );
        }
      ),
    );
  }
}
