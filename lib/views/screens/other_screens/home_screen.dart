import 'package:flutter/material.dart';
import 'package:kentiktok_clone/constants.dart';
import 'package:kentiktok_clone/views/widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (Idx) {
            setState(() {
              pageIdx = Idx;
            });
          },
          backgroundColor: Colors.black ,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white30,
          currentIndex: pageIdx,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: "Search"),
            BottomNavigationBarItem(icon: CustomIcon(), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                  size: 30,
                ),
                label: "Message"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: "Profile"),
          ]),
      body: pages[pageIdx],
    );
  }
}
