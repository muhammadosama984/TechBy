import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs_scrren extends StatefulWidget {
  const ContactUs_scrren({Key? key}) : super(key: key);

  @override
  State<ContactUs_scrren> createState() => _ContactUs_scrrenState();
}

class _ContactUs_scrrenState extends State<ContactUs_scrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40,),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  // border: null,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    // borderRadius: BorderRadius. circular(25.0),
                  ),
                  fillColor: Color.fromRGBO(243, 243, 243, 100),
                  filled: true,
                  hintText: 'Email',
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  // border: null,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                    // borderRadius: BorderRadius. circular(25.0),
                  ),
                  fillColor: Color.fromRGBO(243, 243, 243, 100),
                  filled: true,
                  hintText: 'Mobile Number',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      // border: null,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 2.0),
                          // borderRadius: BorderRadius. circular(25.0),
                        ),

                        fillColor: Color.fromRGBO(243, 243, 243, 100),
                        filled: true,
                        hintText: 'Enter Your Complain',
                        contentPadding: EdgeInsets.symmetric(vertical: 40)
                    ),
                    maxLines: 5, // <-- SEE HERE
                    minLines: 1,
                  ),
                  SizedBox(height: 5,),
                  Container(
                      alignment: Alignment(1.0,0.0),
                      padding: EdgeInsets.only(top: 15.0),
                      child: ButtonTheme(
                          height: 50,
                          minWidth: 100,
                          disabledColor: Colors.blueAccent,
                          child: RaisedButton(
                            disabledElevation: 8.0,
                            onPressed: (){},
                            child: Text("Submit", style: TextStyle(fontSize: 20, color: Colors.white),),
                          )
                      )

                  ),
                  SizedBox(height: 5,),
                  Text("OR",style: TextStyle(fontSize: 20,)),
                  SizedBox(height: 20,),
                  Text("EMAIL US",style: TextStyle(fontSize: 20,)),
                  Text("admin.tchby@gmail.com",style: TextStyle(fontSize: 20,))

                ],
              ),


            ),

          ],
        ),
      ),
    );
  }
}
