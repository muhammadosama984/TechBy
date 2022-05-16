
import 'package:flutter/material.dart';

class suggestedProdText extends StatefulWidget {
  const suggestedProdText({Key? key}) : super(key: key);

  @override
  State<suggestedProdText> createState() => _suggestedProdTextState();
}

class _suggestedProdTextState extends State<suggestedProdText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(
        "Browse Products",
        style: TextStyle(
            fontSize: 16,
            fontFamily: "montserrat",
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}