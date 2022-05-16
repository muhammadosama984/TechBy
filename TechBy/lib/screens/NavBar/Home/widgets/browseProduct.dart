import 'package:flutter/material.dart';

class browseProduct extends StatelessWidget {
  const browseProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 25),
        Container(
          width: 300,
          child: Image(
            image: AssetImage('assets/TBiconLong.png'),
          ),
        ),
        SizedBox(height: 40),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 180, 0),
          child: Text(
            "Browse Categories",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
