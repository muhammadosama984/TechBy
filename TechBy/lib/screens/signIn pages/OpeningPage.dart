import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techby/screens/signIn%20pages/Login_Page.dart';
import 'package:techby/screens/signIn%20pages/Signup_Page.dart';

import 'notification_api.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationApi.init();
    listenNotification();
  }

  void listenNotification() {
    NotificationApi.onNotification.stream.listen(onClick);
  }

  void onClick(String? payload) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Signup_screen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 40,),
            techByLogo(),
            //login_Signup()
            getStart_btn(),
          ],
        )),
      ),
    );
  }
}

class techByLogo extends StatelessWidget {
  const techByLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        margin: EdgeInsets.only(bottom: 23, top: 290, left: 0, right: 13),
        child: Column(children: [
          Image(image: AssetImage('assets/TBiconLong.png')),
          SizedBox(
            height: 170,
          ),

        ]));
  }
}
class getStart_btn extends StatefulWidget {
  const getStart_btn({Key? key}) : super(key: key);

  @override
  State<getStart_btn> createState() => _getStart_btnState();
}

class _getStart_btnState extends State<getStart_btn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Login_screen()));
    },
      child: Container(
          width: 250,
          height: 50,
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Color.fromRGBO(30, 159, 217, 1),
              // border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Microsoft YaHei',
                ),
              ),
              // Icon(
              //   Icons.east,
              //   //color: Color.fromRGBO(30, 159, 217, 1),
              //   color: Colors.white,
              // ),
            ],
          )),);
  }
}

//
// class login_Signup extends StatelessWidget {
//   const login_Signup({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 40),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 5,
//           ),
//           Container(
//             height: 50,
//             width: 250,
//             child: RaisedButton(
//                 color: Color.fromRGBO(30, 159, 217, 1),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => Login_screen()));
//                 },
//                 child: Text(
//                   'LogIn',
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 )),
//           ),
//           SizedBox(
//             width: 200,
//           ),
//           // Container(
//           //   height: 50,
//           //   width: 250,
//           //   margin: EdgeInsets.only(top: 20),
//           //   child: RaisedButton(
//           //       color: Colors.transparent,
//           //       shape: RoundedRectangleBorder(
//           //         side: BorderSide(width: 1, color: Colors.black),
//           //         borderRadius: BorderRadius.circular(5),
//           //       ),
//           //       //color: Colors.black,
//           //       child: Text('SignUp',
//           //           style: TextStyle(fontSize: 20, color: Colors.black)),
//           //       onPressed: () {
//           //         NotificationApi.showNotification(
//           //             title: 'Sarah',
//           //             body: 'This is body',
//           //             payload: 'sarah.abs');
//
//           // Navigator.of(context).push(
//           //     MaterialPageRoute(builder: (context) => Signup_screen()));
//           //       }),
//           // ),
//           InkWell(
//             onTap: () {
//               NotificationApi.showNotification(
//                   title: 'Sarah', body: 'This is body', payload: 'sarah.abs');
//               // Navigator.of(context).push(
//               //     MaterialPageRoute(builder: (context) => Signup_screen()));
//             },
//             child: Container(
//               width: 250,
//               height: 50,
//               margin: EdgeInsets.only(top: 20),
//               // color: Colors.blueAccent,
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black, width: 2),
//                   borderRadius: BorderRadius.circular(5)),
//               child: Center(
//                 child: Text('SignUp',
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500)),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
