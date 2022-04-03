import 'package:flutter/material.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Container(
              width: 230,
              margin: EdgeInsets.only(bottom: 230, top: 130),
              child: Image(image: AssetImage('assets/TBicon.jpeg')),
            ),
            SizedBox(
              height: 120,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  RaisedButton(
                      color: Colors.white,
                      onPressed: () {},
                      child: Text(
                        'LogIn',
                        style: TextStyle(color: Colors.black),
                      )),
                  SizedBox(
                    width: 130,
                  ),
                  RaisedButton(
                      color: Colors.black,
                      child:
                          Text('SignUp', style: TextStyle(color: Colors.white)),
                      onPressed: () {}),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
