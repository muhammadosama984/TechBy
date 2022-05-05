import 'package:flutter/material.dart';
import 'package:techby/screens/Complaint_Page.dart';
import 'package:techby/screens/Merchandiser_Page.dart';
import 'package:techby/screens/signIn%20pages/OpeningPage.dart';

import 'ApproveAds_Page.dart';

class Admin_screen extends StatefulWidget {
  const Admin_screen({Key? key}) : super(key: key);

  @override
  State<Admin_screen> createState() => _Admin_screenState();
}

class _Admin_screenState extends State<Admin_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => OpeningPage()));
              setState(() {});
              //new screen navigate
            },
            icon: Icon(Icons.logout, color: Colors.white,),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 240,
            ),
            ButtonTheme(
                height: 50,
                minWidth: 200,
                disabledColor: Colors.blueAccent,

                child: RaisedButton(
                  disabledElevation: 8.0,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Merchandiser_screen()));
                  },
                  child: Text("Approve Merchant", style: TextStyle(fontSize: 20, color: Colors.white),),
                )
            ),
            SizedBox(
              height: 40,
            ),
            ButtonTheme(
                height: 50,
                minWidth: 200,
                disabledColor: Colors.blueAccent,

                child: RaisedButton(
                  disabledElevation: 8.0,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Complaint_screen()));
                  },
                  child: Text("Complain", style: TextStyle(fontSize: 20, color: Colors.white),),
                )
            ),
            SizedBox(
              height: 40,
            ),
            ButtonTheme(
                height: 50,
                minWidth: 200,
                disabledColor: Colors.blueAccent,

                child: RaisedButton(
                  disabledElevation: 8.0,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Approveads_screen()));
                  },
                  child: Text("ADS Approve", style: TextStyle(fontSize: 20, color: Colors.white),),
                )
            ),

          ],
        ),
      ),
    );
  }
}