
import 'package:flutter/material.dart';
import 'package:techby/screens/NavBar/Home/widgets/Devices.dart';

class categories extends StatefulWidget {
  const categories({Key? key}) : super(key: key);

  @override
  _categoriesState createState() => _categoriesState();
}


class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 5,
          ),
          desktop (),
          mobile(),
          laptop(),
          camera(),
          monitor(),
          speaker(),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}