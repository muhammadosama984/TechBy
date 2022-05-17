import 'package:flutter/material.dart';
import 'package:techby/Discarded%20Files/OTP.dart';

class ForgetPassword_screen extends StatefulWidget {
  const ForgetPassword_screen({Key? key}) : super(key: key);

  @override
  State<ForgetPassword_screen> createState() => _ForgetPassword_screenState();
}

class _ForgetPassword_screenState extends State<ForgetPassword_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forget Password")),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        // child: Center(
        child: Center(
          child: Container(
            height: 600,
            padding: EdgeInsets.only(top: 35.0, left: 50.0, right: 50.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        border: null,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        fillColor: Color.fromRGBO(243, 243, 243, 100),
                        filled: true,
                        labelText: 'Phone Number',
                        hintText: 'Enter Your Phone Number'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ButtonTheme(
                      height: 50,
                      minWidth: 400,
                      disabledColor: Colors.blueAccent,
                      child: RaisedButton(
                        disabledElevation: 8.0,
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => OTP()));
                        },
                        child: Text(
                          "Send Link",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
                  // Container(
                  //   alignment: Alignment(1.0, 0.0),
                  //   padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  //   child: InkWell(
                  //     child: Text(
                  //       "Resent the OTP",
                  //       style: TextStyle(
                  //         color: Colors.blue,
                  //         fontWeight: FontWeight.bold,
                  //         fontFamily: 'Montserrat',
                  //         decoration: TextDecoration.underline,
                  //       ),
                  //     ),
                  //     onTap: () {},
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
