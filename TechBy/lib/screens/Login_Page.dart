import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techby/screens/Signup_Page.dart';
import 'package:techby/screens/mainPage.dart';
import 'package:techby/screens/ForgetPassword_Page.dart';
import 'package:techby/screens/navBarNavigation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  //final String title;
  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        // child: SingleChildScrollView(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100),
                _topPart(),
                SizedBox(height: 60),
                Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      _username(),
                      SizedBox(height: 50),
                      _password(),
                      SizedBox(height: 5),
                      _signUp_pass(),
                      SizedBox(height: 35),
                      _login_button(),
                      SizedBox(height: 35),
                      SocialMediaSignIn(),
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

class _topPart extends StatelessWidget {
  const _topPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 80, child: Image(image: AssetImage('assets/TBicon.jpeg'))),
        SizedBox(
          height: 10,
        ),
        Text(
          "Login",
          style: GoogleFonts.roboto(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _username extends StatelessWidget {
  const _username({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: null,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          fillColor: Color.fromRGBO(243, 243, 243, 100),
          filled: true,
          labelText: 'Username',
          hintText: 'Enter Your Username'),
    );
  }
}

class _password extends StatefulWidget {
  const _password({Key? key}) : super(key: key);

  @override
  State<_password> createState() => _passwordState();
}

class _passwordState extends State<_password> {
  bool ishide = true;
  void _toggle() {
    setState(() {
      ishide = !ishide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: ishide,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                _toggle();
              },
              icon:
                  ishide ? Icon(Icons.visibility) : Icon(Icons.visibility_off)),
          border: null,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          fillColor: Color.fromRGBO(243, 243, 243, 100),
          filled: true,
          labelText: 'Password',
          hintText: 'Enter Your Password'),
    );
  }
}

class _signUp_pass extends StatelessWidget {
  const _signUp_pass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment(1.0, 0.0),
          padding: EdgeInsets.only(top: 15.0, left: 20.0),
          child: InkWell(
            child: Text(
              "Sign Up?",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Signup_screen()));
            },
          ),
        ),
        SizedBox(
          width: 100,
        ),
        Container(
          alignment: Alignment(1.0, 0.0),
          padding: EdgeInsets.only(top: 15.0, left: 20.0),
          child: InkWell(
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ForgetPassword_screen()));
            },
          ),
        ),
      ],
    );
  }
}

class _login_button extends StatelessWidget {
  const _login_button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
      minWidth: 400,
      disabledColor: Colors.blueAccent,
      child: RaisedButton(
        disabledElevation: 8.0,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => navBarNavigation()));
        },
        child: Text(
          "Log In",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

class SocialMediaSignIn extends StatelessWidget {
  const SocialMediaSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
                child: Image(
                    image: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/1200px-2021_Facebook_icon.svg.png'))),
          ),
          SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
                radius: 32,
                child: Image(image: NetworkImage('assets/google.png'))),
          ),
        ],
      ),
    );
  }
}
