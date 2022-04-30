import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:techby/Models/ListofUsers.dart';
import 'package:techby/Models/Users.dart';
import 'package:techby/screens/Login_Page.dart';

class Signup_screen extends StatefulWidget {
  const Signup_screen({Key? key}) : super(key: key);

  @override
  State<Signup_screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController imageURL = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool validate() {
    if (firstname == null ||
        lastname == null ||
        email == null ||
        mobile == null ||
        location == null ||
        imageURL == null ||
        password == null ||
        confirmpassword == null ||
        password.text != confirmpassword.text) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("SignUp Page"),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 10, left: 20.0, right: 20.0, bottom: 35.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                            child: TextFormField(
                          controller: firstname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please write correctly';
                            } else {
                              return null;
                            }
                          },
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
                        Flexible(
                            child: TextFormField(
                          controller: lastname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please write correctly';
                            } else {
                              return null;
                            }
                          },
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
                    TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please write correctly';
                        } else {
                          return null;
                        }
                      },
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
                    TextFormField(
                      controller: mobile,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please write correctly';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          border: null,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          fillColor: Color.fromRGBO(243, 243, 243, 100),
                          filled: true,
                          labelText: 'Mobile Number',
                          hintText: 'Enter Your Mobile Number'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: location,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please write correctly';
                        } else {
                          return null;
                        }
                      },
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
                    TextFormField(
                      controller: imageURL,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please write correctly';
                        } else {
                          return null;
                        }
                      },
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
                    TextFormField(
                      obscureText: true,
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please write correctly';
                        } else {
                          return null;
                        }
                      },
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
                    TextFormField(
                      controller: confirmpassword,
                      validator: (value) {
                        if (value!.isEmpty || password.text != value) {
                          return 'Please write correctly';
                        } else {
                          return null;
                        }
                      },
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<ListofUser>(context, listen: false)
                                      .userListSet =
                                  User(
                                      firstname.text,
                                      lastname.text,
                                      email.text,
                                      location.text,
                                      imageURL.text,
                                      password.text);
                              print(Provider.of<ListofUser>(context,
                                      listen: false)
                                  .returnUserList[0]
                                  .firstname);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login_screen()));
                            }
                            ;
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
