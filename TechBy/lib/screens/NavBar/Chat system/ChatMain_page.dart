import 'dart:convert';
import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import 'package:techby/Models/Users.dart';
import 'package:techby/widgets/Search.dart';
import 'package:techby/Sign _In/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Chat_Page.dart';


class ChatMain_screen extends StatefulWidget {
  const ChatMain_screen({Key? key}) : super(key: key);

  @override
  State<ChatMain_screen> createState() => _ChatMain_screenState();
}

List<ChatUser> data = [
  // ChatUser(
  //     name: "Ashar",
  //     product: "IPhone 13 Pro",
  //     image_name: "assets/smartphone.png"),
  // ChatUser(name: "Osama", product: "Desktop", image_name: "assets/desktop.jpg")
];
String tdata = DateFormat("HH:mm").format(DateTime.now());

class _ChatMain_screenState extends State<ChatMain_screen> {
  void initState() {
    super.initState();
    getChats();

  }
  //
  // Static String fromJson(Map<String, dynamic> json) =>
  //     title: json['title']);
  // Future<List<ChatUser>>
  void  getChats() async {
    data.clear();
    String email = await Provider.of<GoogleSingInProvider>(context, listen: false).emailAddress();
    await FirebaseFirestore.instance.collection('Users').where('email', isEqualTo: email).get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        //List<String> rooms = doc.data['rooms'] as;
       var userMap = doc.data() as Map;
       List<dynamic> rooms = userMap["rooms"];
       rooms.forEach((room) async {
         await FirebaseFirestore.instance.collection('Userrooms').doc(room).get()
             .then((DocumentSnapshot documentSnapshot) {
           var useroomMap = documentSnapshot.data() as Map;
           //print(useroomMap);
           if(useroomMap["buyerid"].toString() == email)
              data.add(ChatUser(name: useroomMap["sellerid"], product: useroomMap["Product"], image_name: useroomMap["Image"], doc_id: documentSnapshot.id));
            // data.add(abc);
           else{
             data.add(ChatUser(name: useroomMap["buyerid"], product: useroomMap["Product"], image_name: useroomMap["Image"], doc_id: documentSnapshot.id));
           }
           setState(() {

           });
           print(data);
             });
       });
        // ads temp = ads.fromJson(doc.data() as Map<String, dynamic>);
        // temp.docID = doc.id;


        // data.add(temp);
        //  print(tasks[0].title);
      });
    });



    // List<DocumentReference> rooms = await current_user.rooms;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: Icon(Icons.search))
        ],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            _topPart(),
            Expanded(
                child: ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) {
                return Card(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Chat_screen()));
                  },
                  child: Container(
                    height: 120,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading:
                              Image(image: AssetImage(data[index].image_name)),
                          title: Text(data[index].name),
                          subtitle: Text(data[index].product),
                          trailing: Column(
                            children: [
                              Text(tdata),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          child: PopupMenuButton(
                              icon: Icon(Icons.more_vert_rounded),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Text("Delete"),
                                      value: 1,
                                    ),
                                  ]),
                        ),
                      ],
                    ),
                  ),
                ));
              }),
              padding: EdgeInsets.all(10),
            )),
          ],
        ),
      ),
    );
  }
}

// class DocumentReferen

class ChatUser {
  String name;
  String product;
  String image_name;
  String doc_id;

  ChatUser(
      {required this.name, required this.product, required this.image_name, required this.doc_id});
}

class _topPart extends StatelessWidget {
  const _topPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'All',
            ),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: Colors.grey.shade400,
                onPrimary: Colors.black),
          ),
          SizedBox(
            width: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Unread'),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: Colors.grey.shade400,
                onPrimary: Colors.black),
          )
        ],
      ),
    );
  }
}
