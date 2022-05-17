
import 'package:flutter/material.dart';
import 'package:techby/screens/NavBar/Home/widgets/browseProduct.dart';
import 'package:techby/screens/NavBar/Home/widgets/categories.dart';
import 'package:techby/screens/NavBar/Home/widgets/textWidgets.dart';

import 'grid.dart';

class mainlist extends StatefulWidget {
  const mainlist({Key? key}) : super(key: key);

  @override
  _mainlistState createState() => _mainlistState();
}

class _mainlistState extends State<mainlist> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: <Widget>[
        browseProduct(),
        categories(),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 10,
        ),
        suggestedProdText(),
        SizedBox(
          height: 40,
        ),
        Grid(),
      ],
    );
  }
}
