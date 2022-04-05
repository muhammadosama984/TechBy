import 'package:flutter/material.dart';
import 'package:techby/screens/ChatMain_page.dart';
import 'package:techby/screens/More_Page.dart';
import '../widgets/bottomBar.dart';
import 'PostAds.dart';
import 'ViewMyAds.dart';
import 'mainPage.dart';

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
      // appBar: AppBar(
      //   title: Text("TechBy"),
      // ),
      body: screens[currentIndex],
      bottomNavigationBar: bottomNavBar(onPressed: (receivedIndex) {
        //setState(() {});

        currentIndex = receivedIndex;
        setState(() {});
      }),
    );
  }
}
