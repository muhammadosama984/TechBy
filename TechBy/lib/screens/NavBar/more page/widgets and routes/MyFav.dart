import 'package:flutter/material.dart';
import 'package:techby/widgets/Listview.dart';

class MyFav extends StatelessWidget {
  const MyFav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourites Items"),
      ),
      // body: Lists(),
    );
  }
}
