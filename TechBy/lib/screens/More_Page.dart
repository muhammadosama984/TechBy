import 'package:flutter/material.dart';
import 'package:techby/screens/ContactUs_Page.dart';
import 'package:techby/screens/FAQs_Page.dart';
import 'package:techby/screens/MyFav.dart';
import 'package:techby/screens/OpeningPage.dart';
import 'package:techby/screens/Profile_Page.dart';

import 'ForgetPassword_Page.dart';

class More_screen extends StatefulWidget {
  const More_screen({Key? key}) : super(key: key);

  @override
  State<More_screen> createState() => _More_screenState();
}

List<String> data = ["My Favorite", "FAQS", "Contact Us", "Logout"];

class _More_screenState extends State<More_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            _topPart(),
            SizedBox(
              height: 50,
            ),
            _lowerPart(),
          ],
        ),
      ),
    );
  }
}

class _topPart extends StatelessWidget {
  const _topPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2016/08/31/11/54/user-1633249_960_720.png'),
          // backgroundColor: Colors.transparent,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("User 123"),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment(1.0, 0.0),
              // padding: EdgeInsets.only(top: 15.0, left: 20.0),
              child: InkWell(
                child: Text(
                  "View Profile >",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    // decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Profile_screen()));
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _lowerPart extends StatelessWidget {
  const _lowerPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        Card(
            child: ListTile(
                leading: Icon(Icons.favorite),
                title: Text("My Favorite"),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MyFav()));
                })),
        Card(
          child: ListTile(
              leading: Icon(Icons.question_answer_rounded),
              title: Text("FAQs"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FAQs_screen()));
              }),
        ),
        Card(
            child: ListTile(
                leading: Icon(Icons.message_sharp),
                title: Text("Contact  Us"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ContactUs_scrren()));
                })),
        Card(
            child: ListTile(
          leading: Icon(
            Icons.logout_outlined,
            color: Colors.red,
          ),
          title: Text(
            "Logout",
            style: TextStyle(color: Colors.red),
          ),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => OpeningPage()));
          },
        )),
      ],
      padding: EdgeInsets.all(10),
    ));
  }
}
