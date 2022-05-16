import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final controllerSubject = TextEditingController();
final controllerMessage = TextEditingController();

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
        backgroundColor: Color.fromRGBO(30, 159, 217, 1),
        //title: Text("Contact Us"),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            submit_complain_txt(),
            //email_box(),
            subject_field(),
            complaint_field(),
            submit_btn(),
            or_email_us(),
            SizedBox(height: 300),
          ],
        ),
      ),
    );
  }
}

class submit_complain_txt extends StatefulWidget {
  const submit_complain_txt({Key? key}) : super(key: key);

  @override
  State<submit_complain_txt> createState() => _submit_complain_txtState();
}

class _submit_complain_txtState extends State<submit_complain_txt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Customer Contact Form",
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 27,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class email_box extends StatefulWidget {
  const email_box({Key? key}) : super(key: key);

  @override
  State<email_box> createState() => _email_boxState();
}

class _email_boxState extends State<email_box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
      width: 320,
      child: TextField(
        decoration: InputDecoration(
          // border: null,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            // borderRadius: BorderRadius. circular(25.0),
          ),
          //fillColor: Colors.white70,
          fillColor: Color.fromRGBO(243, 243, 243, 100),
          filled: true,
          hintText: 'Email',
        ),
      ),
    );
  }
}

class subject_field extends StatefulWidget {
  const subject_field({Key? key}) : super(key: key);

  @override
  State<subject_field> createState() => _subject_fieldState();
}

class _subject_fieldState extends State<subject_field> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
      width: 320,
      child: TextField(
        controller: controllerSubject,
        decoration: InputDecoration(
          // border: null,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            // borderRadius: BorderRadius. circular(25.0),
          ),
          fillColor: Color.fromRGBO(243, 243, 243, 100),
          filled: true,
          hintText: 'Subject',
        ),
      ),
    );
  }
}

class complaint_field extends StatefulWidget {
  const complaint_field({Key? key}) : super(key: key);

  @override
  State<complaint_field> createState() => _complaint_fieldState();
}

class _complaint_fieldState extends State<complaint_field> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 35, 20, 0),
      width: 320,
      //height: 200,
      
      //     height: 120,
      //    child:
      // SizedBox(
      //       height: 120,
      //   width: 320,

      //height: 100,
      child: TextField(
        
        
        // expands: true,
        controller: controllerMessage,
        textAlignVertical: TextAlignVertical.top,
        //style: TextStyle(height: 5),
        decoration: const InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 150),
          // border: null,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
            // borderRadius: BorderRadius. circular(25.0),
          ),
          fillColor: Color.fromRGBO(243, 243, 243, 100),
          filled: true,
          hintText: 'Message',
          //contentPadding: EdgeInsets.symmetric(vertical: 40)
        ),
        //keyboardType: TextInputType.multiline,
        //
        maxLines: 8, // <-- SEE HERE
        minLines: 1,
      ),
      //  ),
    );
  }
}

class submit_btn extends StatefulWidget {
  const submit_btn({Key? key}) : super(key: key);

  @override
  State<submit_btn> createState() => _submit_btnState();
}

class _submit_btnState extends State<submit_btn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 35, 20, 0),
      width: 320,
      height: 60,
      child: RaisedButton(
        color: Color.fromRGBO(30, 159, 217, 1),
        disabledElevation: 8.0,
        onPressed: () async {
          String email_admin = 'admin.techby@gmail.com';
          String subject = controllerSubject.text;
          String message = controllerMessage.text;
          String url = "mailto:$email_admin?subject=$subject&body=$message";
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw "Error occured sending an email";
          }
        },
        child: Text(
          "Submit",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}

class or_email_us extends StatefulWidget {
  const or_email_us({Key? key}) : super(key: key);

  @override
  State<or_email_us> createState() => _or_email_usState();
}

class _or_email_usState extends State<or_email_us> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Or email us at ",
                style: TextStyle(
                  fontSize: 14,
                )),
            InkWell(
              onTap: () async {
                String email_admin = 'admin.techby@gmail.com';
                String url = "mailto:$email_admin?";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw "Error occured sending an email";
                }
              },
              child: Text("admin.techby@gmail.com",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  )),
            ),
          ],
        ));
  }
}
// Future launchEmail
// final Uri emailLaunchUri = Uri(
//   scheme: 'mailto',
//   path: 'smith@example.com',
// );
// void _launchUrl() async {
//   if (!await launchUrl(emailLaunchUri)) throw 'Could not launch $emailLaunchUri';
// }
