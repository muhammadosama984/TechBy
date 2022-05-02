import 'package:flutter/material.dart';
import 'package:techby/screens/more%20page/widgets%20and%20routes/FAQs_datail.dart';

class FAQs_screen extends StatefulWidget {
  const FAQs_screen({Key? key}) : super(key: key);

  @override
  State<FAQs_screen> createState() => _FAQs_screenState();
}

class _FAQs_screenState extends State<FAQs_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs"),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FAQ_Detail()));
                  },
                  child: Card(
                      child: ListTile(
                    leading: Icon(Icons.question_answer_outlined),
                    title: Text("What are the methods of payment?"),
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FAQ_Detail()));
                  },
                  child: Card(
                      child: ListTile(
                    leading: Icon(Icons.question_answer_outlined),
                    title: Text("Why my account is banned?"),
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FAQ_Detail()));
                  },
                  child: Card(
                      child: ListTile(
                    leading: Icon(Icons.question_answer_outlined),
                    title: Text(
                        "How to contact seller/buyer through email or sms?"),
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FAQ_Detail()));
                  },
                  child: Card(
                      child: ListTile(
                    leading: Icon(Icons.question_answer_outlined),
                    title: Text("MWhy am I not seeing my ads?"),
                  )),
                ),
              ],
              padding: EdgeInsets.all(10),
            )),
          ],
        ),
      ),
    );
  }
}
