import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../login page widgets/googleSignIn.dart';
import '../login page widgets/login_btn_temp.dart';
import '../login page widgets/topPartLogin.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);
  @override
  State<Login_screen> createState() => _Login_screenState();
}

List<String> items = ['User', 'Admin'];
String? value1;

class _Login_screenState extends State<Login_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 130),
                 topPartLogin(),
                 SizedBox(height: 0),
                Container(
                  padding:
                   EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                    googleSignIn(),
                    SizedBox(height: 35),
                      login_btn_temp(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

