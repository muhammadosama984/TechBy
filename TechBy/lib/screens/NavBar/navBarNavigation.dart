import 'package:flutter/material.dart';

import '../../widgets/bottomBar.dart';
import 'Chat system/ChatMain_page.dart';
import 'Home/mainPage.dart';
import 'Post ad/PostAds.dart';
import 'My Ads/ViewMyAds.dart';
import 'more page/More_Page.dart';

class navBarNavigation extends StatefulWidget {
  const navBarNavigation({Key? key}) : super(key: key);

  @override
  _navBarNavigationState createState() => _navBarNavigationState();
}

class _navBarNavigationState extends State<navBarNavigation> {
  int currentIndex = 0;
  final screens = [
    MyHomePage(),
    ViewMyAds(),
    PostAds(),
    ChatMain_screen(),
    More_screen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: bottomNavBar(onPressed: (receivedIndex) {
        currentIndex = receivedIndex;
        setState(() {});
      }),
    );
  }
}
