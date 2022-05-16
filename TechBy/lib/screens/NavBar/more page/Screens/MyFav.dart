import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/general%20widgets/Listview.dart';



class MyFav extends StatelessWidget {
  const MyFav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourites Items"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Lists(comingList: context.read<adsList>().ListOfMyFav),
          ),
        ],
      ),
    );
  }
}
