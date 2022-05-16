import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign%20_In/googleUser.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';

import 'package:techby/screens/signIn%20pages/signInScreens/OpeningPage.dart';
import 'package:techby/screens/Profile_Page.dart';

import 'widgets/lowerpart.dart';
import 'widgets/topPart.dart';





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
            topPart(),
            SizedBox(
              height: 80,
            ),
            lowerPart(),
          ],
        ),
      ),
    );
  }
}

