import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign%20_In/googleUser.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';

import 'package:techby/screens/signIn%20pages/OpeningPage.dart';
import 'package:techby/screens/Profile_Page.dart';

import 'widgets and routes/ContactUs_Page.dart';
import 'widgets and routes/FAQs_Page.dart';
import 'widgets and routes/MyFav.dart';

class More_screen extends StatefulWidget {
  const More_screen({Key? key}) : super(key: key);

  @override
  State<More_screen> createState() => _More_screenState();
}

List<String> data = ["My Favorite", "FAQS", "Contact Us", "Logout"];

class _More_screenState extends State<More_screen> {
  late googleUser userDetails;

  void getURL() async {
    String photo = await context.read<GoogleSingInProvider>().photoUrl();
    String name = await context.read<GoogleSingInProvider>().userName();
    String email = await context.read<GoogleSingInProvider>().emailAddress();
    userDetails = googleUser(email: email, userName: name, profilePic: photo);
  }

  @override
  void initState() {
    // TODO: implement initState
    getURL();
    super.initState();
  }

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
              height: 80,
            ),
            _topPart(),
            SizedBox(
              height: 80,
            ),
            _lowerPart(),
          ],
        ),
      ),
    );
  }
}

class _topPart extends StatefulWidget {
  const _topPart({Key? key}) : super(key: key);

  @override
  State<_topPart> createState() => _topPartState();
}

class _topPartState extends State<_topPart> {
  void printThings() async {
    print(await Provider.of<GoogleSingInProvider>(context, listen: false)
        .emailAddress());
    print(await Provider.of<GoogleSingInProvider>(context, listen: false)
        .userName());

    print(await Provider.of<GoogleSingInProvider>(context, listen: false)
        .photoUrl());
  }

  @override
  void initState() {
    // TODO: implement initState
    // printThings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              // Provider.of<GoogleSingInProvider>(context, listen: false)
              //     .photoUrl()
              //     .toString()
              Provider.of<GoogleSingInProvider>(context, listen: false)
                  .userDetails
                  .profilePic
                  .toString()),
          // backgroundColor: Colors.transparent,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(Provider.of<GoogleSingInProvider>(context, listen: false)
                .userDetails
                .userName
                .toString(),style: TextStyle(fontSize: 24, color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Montserrat',)),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   alignment: Alignment(1.0, 0.0),
            //   // padding: EdgeInsets.only(top: 15.0, left: 20.0),
            //   child: InkWell(
            //     child: Text(
            //       "View Profile >",
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontFamily: 'Montserrat',
            //         // decoration: TextDecoration.underline,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => Profile_screen()));
            //     },
            //   ),
            // ),
          ],
        )
      ],
    );
  }
}

class _lowerPart extends StatelessWidget {


  _lowerPart({Key? key}) : super(key: key);
  double i=6.0;
  double j = 4.0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        Card(
          elevation: j,
            margin: EdgeInsets.all(i),
            shadowColor: Colors.black,
            child: ListTile(
                tileColor: Colors.white,
                leading: Icon(Icons.favorite, color: Colors.red),
                title: Text("My Favorite"),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MyFav()));
                })),
        Card(
          elevation: j,
          margin: EdgeInsets.all(i),
          shadowColor: Colors.black,
          child: ListTile(
              tileColor: Colors.white,
              leading: Icon(Icons.question_answer_rounded, color: Color.fromRGBO(30, 159, 217, 1)),
              title: Text("FAQs"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FAQs_screen()));
              }),
        ),
        Card(
          elevation: j,
            margin: EdgeInsets.all(i),
            shadowColor: Colors.black,
            child: ListTile(
                tileColor: Colors.white,
                leading: Icon(Icons.message_sharp, color: Color.fromRGBO(30, 159, 217, 1)),
                title: Text("Contact  Us"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ContactUs_scrren()));
                })),
        Card(
          elevation: j,
            margin: EdgeInsets.all(i),
            shadowColor: Colors.black,
            child: ListTile(
              tileColor: Colors.white,
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.red,
              ),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Provider.of<GoogleSingInProvider>(context, listen: false)
                    .googleSignOut();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OpeningPage()));
              },
            )),
      ],
      padding: EdgeInsets.all(8),
    ));
  }
}
