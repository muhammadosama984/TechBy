import 'package:flutter/material.dart';

class FAQ_Detail extends StatefulWidget {
  const FAQ_Detail({Key? key}) : super(key: key);

  @override
  State<FAQ_Detail> createState() => _FAQ_DetailState();
}

class _FAQ_DetailState extends State<FAQ_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(30, 159, 217, 1),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Payment Methods:",
                  style: TextStyle(
                      //decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      fontSize: 20),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(
                    "Always insist on meeting with the buyer personally and exchanging your item for money. Use a safe location to meet.",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 14),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Account banned?",
                  style: TextStyle(
                      //decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      fontSize: 20),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(
                    "We disable TechBY accounts that might not follow the TechBY Terms. Some examples include: Using a fake name. "
                    "Impersonating someone. Contacting other people "
                    "for the purpose of harassment or other conduct that's not allowed. Email us at our official "
                    "handle to review your case",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 14),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Contact Seller",
                  style: TextStyle(
                      //decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      fontSize: 20),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(
                    "Use our built in chat system to contact seller/buyer",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 14),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Sharing personal information:",
                  style: TextStyle(
                      //decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      fontSize: 20),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(
                    "Don’t share any private details or financial information except the one necessary. "
                    "We advise that sensitive information such as (IMEI no.) or (PCBA no.), should not be disclosed to any user.",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 14),
                  ),
                ),
              ],
            )));
  }
}
