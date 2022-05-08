import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:techby/screens/Admin_Page.dart';
import 'package:techby/screens/NavBar/navBarNavigation.dart';
import 'package:techby/screens/signIn%20pages/Signup_Page.dart';
import 'package:techby/screens/ForgetPassword_Page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';

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
  //addition
  // List<String> labels = ['User', 'Admin'];
  // int counter = 0;
//  List<bool> _selections = List.generate(2, (_) => true);
  List<bool> _selections = [true, false];

  //addition

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
            // width: 80, child: Image(image: AssetImage('assets/TBicon.jpeg'))),
            width: 250,
            child: Image(image: AssetImage('assets/TBiconLong.png'))),
        SizedBox(
          height: 30,

        ),
        Center(
          child: Text(
            "Sign In to TechBy",
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 30,
          // alignment: Alignment(1.0, 0.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),

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
        SizedBox(
          height: 30,
        ),
        Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(16.0),
            color: Colors.grey.shade100,
          ),
          child: ToggleButtons(
            children: [
              Text('    User    '),
              Text("   Admin   "),
            ],

            color: Colors.black,
            highlightColor: Colors.white70,
            selectedColor: Colors.white,
            fillColor: Colors.blue,
            splashColor: Colors.lightBlueAccent,
//        hoverColor: Colors.white70,
            renderBorder: false,
            borderColor: Colors.black,
            borderRadius: BorderRadius.circular(16),
            isSelected: _selections,
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < _selections.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    _selections[buttonIndex] = true;
                  } else {
                    _selections[buttonIndex] = false;
                  }
                }
                //_selections[index] = !_selections[index];
              });
            }, //onPress
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
          padding: EdgeInsets.only(top: 15.0, left: 0.0),
          child: InkWell(
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
                // decoration: TextDecoration.underline,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Signup_screen()));
            },
          ),

          // child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //   Text("data"),
          // InkWell(
          //     child: Text(
          //       "Sign Up?",
          //       style: TextStyle(
          //         color: Colors.black,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: 'Montserrat',
          //         // decoration: TextDecoration.underline,
          //       ),
          //     ),
          //     onTap: () {
          //       Navigator.of(context).push(
          //           MaterialPageRoute(builder: (context) => Signup_screen()));
          //     },
          //   ),
          //
          // ]),
        ),
        SizedBox(
          width: 100,
        ),
        Container(
          alignment: Alignment(1.0, 0.0),
          padding: EdgeInsets.only(top: 15.0, left: 40.0),
          child: InkWell(
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontFamily: 'Montserrat',
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

    //ahmed
    // return Container(
    //   alignment: Alignment(1.0, 0.0),
    //   padding: EdgeInsets.only(top: 15.0, left: 40.0),
    //   child: InkWell(
    //     child: Text(
    //       "Forgot Password?",
    //       style: TextStyle(
    //         color: Colors.grey,
    //         fontWeight: FontWeight.normal,
    //         fontFamily: 'Montserrat',
    //       ),
    //     ),
    //     onTap: () {
    //       Navigator.of(context).push(
    //           MaterialPageRoute(builder: (context) => ForgetPassword_screen()));
    //     },
    //   ),
    // );
    // //ahmed
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: RaisedButton(
        disabledElevation: 8.0,
        onPressed: () {
          if (value1 == null) {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("Error", style: TextStyle(color: Colors.red)),
                content:
                    Text("Please select login type from the drop down option"),
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
          } else if (value1 == "User") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => navBarNavigation()));
            value1 = null;
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Admin_screen()));
            value1 = null;
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

class SocialMediaSignIn extends StatefulWidget {
  const SocialMediaSignIn({Key? key}) : super(key: key);

  @override
  _SocialMediaSignInState createState() => _SocialMediaSignInState();
}

class _SocialMediaSignInState extends State<SocialMediaSignIn> {
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
                child: Image(image: AssetImage('assets/facebook.png'))),
          ),
          SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () async {
              //context.read()<GoogleSingInProvider>().googleSignIn;
              await Provider.of<GoogleSingInProvider>(context, listen: false)
                  .googleLogin();
              if (context.read<GoogleSingInProvider>().signInDone) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => navBarNavigation()));
              }
            },
            child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image(image: AssetImage('assets/google.png'))),
          ),
        ],
      ),
    );
  }
}

//
// class signUpLink extends StatefulWidget {
//   const signUpLink({Key? key}) : super(key: key);
//
//   @override
//   State<signUpLink> createState() => _signUpLinkState();
// }
//
// class _signUpLinkState extends State<signUpLink> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text("Hello"),
//     );
//   }
// }
