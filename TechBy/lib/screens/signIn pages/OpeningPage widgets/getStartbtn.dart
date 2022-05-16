
import 'package:flutter/material.dart';

import '../signInScreens/Login_Page.dart';

class getStart_btn extends StatefulWidget {
  const getStart_btn({Key? key}) : super(key: key);

  @override
  State<getStart_btn> createState() => _getStart_btnState();
}

class _getStart_btnState extends State<getStart_btn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Login_screen()));
      },
      child: Container(
        width: 250,
        height: 60,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(30, 159, 217, 1),
            // border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(35)),
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
          ],
        ),
      ),
    );
  }
}
