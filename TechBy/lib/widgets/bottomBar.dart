import 'package:flutter/material.dart';

class bottomNavBar extends StatefulWidget {
  Function(int) onPressed;

  bottomNavBar({Key? key, required this.onPressed}) : super(key: key);

  @override
  _bottomNavBarState createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Color.fromRGBO(30, 159, 217, 1),
      type: BottomNavigationBarType.fixed,
      //backgroundColor: ,
      //selectedItemColor: ,
      //unselectedItemColor: ,
      currentIndex: index,
      onTap: (curIndex) {


        setState(() {index=curIndex;});
        widget.onPressed(index);
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Color.fromRGBO(30, 159, 217, 1)),
        BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books),
            label: "My Ads",
            backgroundColor: Color.fromRGBO(30, 159, 217, 1)),
        BottomNavigationBarItem(
            icon: Icon(Icons.my_library_add),
            label: "Sell Now",
            backgroundColor: Color.fromRGBO(30, 159, 217, 1)),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chats",
            backgroundColor: Color.fromRGBO(30, 159, 217, 1)),
        BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "More",
            backgroundColor: Color.fromRGBO(30, 159, 217, 1)),
      ],
    );
  }
}
