import 'package:flutter/material.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({Key? key}) : super(key: key);

  @override
  _bottomNavBarState createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      //backgroundColor: ,
      //selectedItemColor: ,
      //unselectedItemColor: ,
      currentIndex: index,
      onTap: (curIndex) => setState(() => index = curIndex),
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books),
            label: "My Ads",
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.my_library_add),
            label: "Sell Now",
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chats",
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "More",
            backgroundColor: Colors.blue),
      ],
    );
  }
}