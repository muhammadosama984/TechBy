import 'package:flutter/material.dart';

class ForgetPassword_screen extends StatefulWidget {
  const ForgetPassword_screen({Key? key}) : super(key: key);

  @override
  State<ForgetPassword_screen> createState() => _ForgetPassword_screenState();
}

class _ForgetPassword_screenState extends State<ForgetPassword_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password")),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        // child: Center(
          child: Center(
            child: Container(
              height: 600,
              padding: EdgeInsets.only(top: 35.0, left: 30.0, right: 30.0),
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
                        labelText: 'Username',
                        hintText: 'Enter Your Username'),
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
                        onPressed: (){},
                        child: Text("Send Link", style: TextStyle(fontSize: 20, color: Colors.white),),
                      )
                  ),
                ],
              ),),

            ),
          ),
        // ),
      ),
    );
  }
}
