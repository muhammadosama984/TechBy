import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign _In/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'Animations/CustomPageRoute.dart';
import 'Chat_Page.dart';

class ChatMain_screen extends StatefulWidget {
  const ChatMain_screen({Key? key}) : super(key: key);

  @override
  State<ChatMain_screen> createState() => _ChatMain_screenState();
}

//Variables
List<ChatUser> data = [];
String tdata = DateFormat("HH:mm").format(DateTime.now());

class _ChatMain_screenState extends State<ChatMain_screen> {
  void initState() {
    super.initState();
    getChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        automaticallyImplyLeading: false,
        actions: [],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[_topPart(), _Chatlist()],
        ),
      ),
    );
  }

  //Function to get chatlist from Database
  void getChats() async {
    data.clear();
    String email =
        await Provider.of<GoogleSingInProvider>(context, listen: false)
            .emailAddress();
    await FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        var userMap = doc.data() as Map;
        List<dynamic> rooms = userMap["rooms"];
        for (var room in rooms) {
          await FirebaseFirestore.instance
              .collection('Userrooms')
              .doc(room)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            var useroomMap = documentSnapshot.data() as Map;
            if (useroomMap["buyerid"].toString() == email)
              data.add(ChatUser(
                  name: useroomMap["sellerid"],
                  product: useroomMap["Product"],
                  image_name: useroomMap["Image"],
                  doc_id: documentSnapshot.id));
            else {
              data.add(ChatUser(
                  name: useroomMap["buyerid"],
                  product: useroomMap["Product"],
                  image_name: useroomMap["Image"],
                  doc_id: documentSnapshot.id));
            }
            setState(() {});
          });
        }
      });
    });
  }
}

//Widgets
class _topPart extends StatelessWidget {
  const _topPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("All Messages",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.blueGrey[800])),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class _Chatlist extends StatelessWidget {
  const _Chatlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: data.length,
      itemBuilder: ((context, index) {
        return Card(
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CustomPageRoute(
                          child: Chat_screen(
                        docid: data[index].doc_id,
                      )));
                },
                child: Container(
                    //height: 120,
                    child: Column(children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 60,
                      child: Icon(
                        Icons.account_circle_sharp,
                        size: 50,
                        color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                      ),
                    ),
                    title: Text(
                      data[index].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    subtitle: Text(
                      "Tap to Open",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    trailing:
                        // Text(tdata),
                        IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CustomPageRoute(
                                child: Chat_screen(
                              docid: data[index].doc_id,
                            )));
                      },
                    ),
                  ),
                ]))));
      }),
      padding: EdgeInsets.all(10),
    ));
  }
}

//Custom Class
class ChatUser {
  String name;
  String product;
  String image_name;
  String doc_id;

  ChatUser(
      {required this.name,
        required this.product,
        required this.image_name,
        required this.doc_id});
}

