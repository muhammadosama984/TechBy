import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techby/screens/ForgetPassword_Page.dart';

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
                SizedBox(
                  height: 100,
                ),
                Text(
                  "TechBy Account Login",
                  style: GoogleFonts.roboto(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            border: null,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            fillColor: Color.fromRGBO(243, 243, 243, 100),
                            filled: true,
                            labelText: 'Username',
                            hintText: 'Enter Your Username'),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: null,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            fillColor: Color.fromRGBO(243, 243, 243, 100),
                            filled: true,
                            labelText: 'Password',
                            hintText: 'Enter Your Password'),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        alignment: Alignment(1.0,0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text("Forgot Password?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPassword_screen()));
                          },
                        ),
                      ),
                      SizedBox(height: 35,),
                      ButtonTheme(
                          height: 50,
                          minWidth: 400,
                          disabledColor: Colors.blueAccent,
                          child: RaisedButton(
                            disabledElevation: 8.0,
                            onPressed: (){},
                            child: Text("Log In", style: TextStyle(fontSize: 20, color: Colors.white),),
                          )
                      )
                    ],
                  ),
                ),
                // Container(
                //
                //   width: 500,
                //   child: TextField(
                //     decoration: InputDecoration(
                //         border: OutlineInputBorder(),
                //         fillColor: Colors.white70,
                //         filled: true,
                //         labelText: 'Username',
                //         hintText: 'Enter Your Username'),
                //   ),
                // ),
                // SizedBox(
                //   height: 60,
                // ),
                // Container(
                //   width: 500,
                //   child: TextField(
                //     obscureText: true,
                //     decoration: InputDecoration(
                //         border: OutlineInputBorder(),
                //         fillColor: Colors.white70,
                //         filled: true,
                //         labelText: 'Password',
                //         hintText: 'Enter Your Password'),
                //   ),
                // ),
                // SizedBox(height: 5,),
                // Container(
                //   alignment: Alignment(0.44,0.0),
                //   padding: EdgeInsets.only(top: 15.0, left: 20.0),
                //   child: InkWell(
                //     child: Text("Forgot Password"),
                //   ),
                // )
              ],
            )
          ],
        ),


        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget> [
        //     Text("TechBy Account Login", style: TextStyle(fontSize: 40, color: Colors.black.withOpacity(1.0), fontStyle: FontStyle.normal)),
        //     SizedBox(height: 300,),
        //     TextField(
        //       decoration: InputDecoration(
        //           border: OutlineInputBorder(),
        //           labelText: 'Enter Name',
        //           hintText: 'Enter Your Name'
        //       ),
        //     ),
        //
        //   ],
        // ),
      ),
    );
  }
}