import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techby/screens/signIn%20pages/Login_Page.dart';
import 'package:techby/screens/Signup_Page.dart';
import 'package:techby/screens/navBarNavigation.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            techByLogo(),
            SizedBox(
              height: 20,
            ),
            login_Signup()
          ],
        )),
      ),
    );
  }
}

class techByLogo extends StatelessWidget {
  const techByLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(bottom: 23, top: 290),
      child: Image(image: AssetImage('assets/TBicon.jpeg')),
    );
  }
}

class login_Signup extends StatelessWidget {
  const login_Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 130,
            child: RaisedButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Login_screen()));
                },
                child: Text(
                  'LogIn',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
          SizedBox(
            width: 200,
          ),
          Container(
            height: 50,
            width: 130,
            margin: EdgeInsets.only(top: 20),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                //color: Colors.black,
                child: Text('SignUp',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Signup_screen()));
                }),
          ),
        ],
      ),
    );
  }
}
