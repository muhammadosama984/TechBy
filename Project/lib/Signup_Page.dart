import 'package:flutter/material.dart';

class Signup_screen extends StatefulWidget {
  const Signup_screen({Key? key}) : super(key: key);

  @override
  State<Signup_screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(

        child: Column(
          children: <Widget>[
        Container(
        padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40,),
            Row(
              children: <Widget>[
                Flexible(child: TextField(
                  decoration: InputDecoration(
                      border: null,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      fillColor: Color.fromRGBO(243, 243, 243, 100),
                      filled: true,
                      labelText: 'First Name',
                      hintText: 'Enter Your First Name'),
                )),
                SizedBox(
                  width: 40,
                ),
                Flexible(child: TextField(
                  decoration: InputDecoration(
                      border: null,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      fillColor: Color.fromRGBO(243, 243, 243, 100),
                      filled: true,
                      labelText: 'Last Name',
                      hintText: 'Enter Your Last Name'),
                )),



              ],
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  border: null,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  fillColor: Color.fromRGBO(243, 243, 243, 100),
                  filled: true,
                  labelText: 'Email',
                  hintText: 'Enter Your Email'),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: null,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  fillColor: Color.fromRGBO(243, 243, 243, 100),
                  filled: true,
                  labelText: 'PMobile Number',
                  hintText: 'Enter Your Mobile Number'),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  border: null,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  fillColor: Color.fromRGBO(243, 243, 243, 100),
                  filled: true,
                  labelText: 'Location',
                  hintText: 'Enter Your Location'),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: null,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  fillColor: Color.fromRGBO(243, 243, 243, 100),
                  filled: true,
                  labelText: 'Upload Picture',
                  hintText: 'Upload Your Picture'),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  border: null,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  fillColor: Color.fromRGBO(243, 243, 243, 100),
                  filled: true,
                  labelText: 'Password',
                  hintText: 'Enter Your Password'),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: null,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  fillColor: Color.fromRGBO(243, 243, 243, 100),
                  filled: true,
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Your Password'),
            ),
            SizedBox(
              height: 30,
            ),
            ButtonTheme(
                height: 50,
                minWidth: 400,
                disabledColor: Colors.blueAccent,

                child: RaisedButton(
                  disabledElevation: 8.0,
                  onPressed: (){},
                  child: Text("Sign Up", style: TextStyle(fontSize: 20, color: Colors.white),),
                )
            ),
          ],
      ),),


          ],

        ),
      ),
    );
  }
}
