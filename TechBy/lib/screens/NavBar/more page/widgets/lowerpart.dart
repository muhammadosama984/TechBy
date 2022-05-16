
import 'package:flutter/material.dart';

import 'tiles.dart';

class lowerPart extends StatelessWidget {
  lowerPart({Key? key}) : super(key: key);
  double i = 6.0;
  double j = 4.0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          myFavTile(i: i, j: j),
          FAQ_Tile(i: i, j: j),
          ContactUsTile(i: i, j: j),
          LogoutTile(i: i, j: j),
        ],
        padding: EdgeInsets.all(8),
      ),);
  }
}
