import 'package:flutter/material.dart';

class FAQ_Detail extends StatefulWidget {
  const FAQ_Detail({Key? key}) : super(key: key);

  @override
  State<FAQ_Detail> createState() => _FAQ_DetailState();
}

class _FAQ_DetailState extends State<FAQ_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.question_answer_outlined),
                Text(
                  "What are the methods of payment?",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto",
                      fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui dicta minus molestiae vel beatae natus eveniet ratione temporibus aperiam harum "),
            )
          ],
        ));
  }
}
