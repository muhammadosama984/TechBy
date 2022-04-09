import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techby/screens/Admin_Page.dart';
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

List<String> items = ['User', 'Admin'];
String? value1;

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
                SizedBox(height: 80),
                _topPart(),
                SizedBox(height: 30),
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

class _topPart extends StatefulWidget {
  const _topPart({Key? key}) : super(key: key);

  @override
  State<_topPart> createState() => _topPartState();
}

class _topPartState extends State<_topPart> {
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
        SizedBox(
          height: 20,
        ),
        Container(
          // alignment: Alignment(1.0, 0.0),
          padding: EdgeInsets.only(top: 15.0, left: 20.0),
          child: DropdownButton(
            // Initial Value
            value: value1,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (value) {
              setState(() {
                value1 = value.toString();
              });
            },
          ),
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

class _signUp_pass extends StatefulWidget {
  const _signUp_pass({Key? key}) : super(key: key);

  @override
  State<_signUp_pass> createState() => _signUp_passState();
}

class _signUp_passState extends State<_signUp_pass> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
          if(value1 == null){
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("Error",style: TextStyle(color: Colors.red)),
                content: Text("Please select login type from the drop down option"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("Ok"),
                  ),
                ],
              ),
            );
          }
          else if (value1 == "User") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => navBarNavigation()));
            value1 =  null;
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Admin_screen()));
            value1 =  null;
          }
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
              backgroundColor: Colors.white,
                child: Image(
                    image: AssetImage('assets/facebook.png'))),
          ),
          SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Colors.white,
                child: Image(image: AssetImage('assets/google.png'))),
          ),
        ],
      ),
    );
  }
}
