import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign _In/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:techby/screens/ProductDetail.dart';
import 'Chat_Page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
        //List<String> rooms = doc.data['rooms'] as;
        var userMap = doc.data() as Map;
        List<dynamic> rooms = userMap["rooms"];
        for (var room in rooms) {
          await FirebaseFirestore.instance
              .collection('Userrooms')
              .doc(room)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            var useroomMap = documentSnapshot.data() as Map;
            // print(useroomMap);
            if (useroomMap["buyerid"].toString() == email)
              data.add(ChatUser(
                  name: useroomMap["sellerid"],
                  product: useroomMap["Product"],
                  image_name: useroomMap["Image"],
                  doc_id: documentSnapshot.id));
            // data.add(abc);
            else {
              data.add(ChatUser(
                  name: useroomMap["buyerid"],
                  product: useroomMap["Product"],
                  image_name: useroomMap["Image"],
                  doc_id: documentSnapshot.id));
            }
            setState(() {});
            //print(data);
          });
        }
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
        backgroundColor: Color.fromRGBO(30, 159, 217, 1),
        title: Text("Chats"),
        automaticallyImplyLeading: false,
        actions: [
          // IconButton(
          //     onPressed: () => Navigator.of(context)
          //         .push(MaterialPageRoute(builder: (_) => SearchPage())),
          //     icon: Icon(Icons.search))
        ],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            _topPart(),
            // Expanded(
            //     child: ListView.builder(
            //   itemCount: data.length,
            //   itemBuilder: ((context, index) {
            //     return Card(
            //         elevation: 3,
            //         child: GestureDetector(
            //           onTap: () {
            //             Navigator.of(context).push(MaterialPageRoute(
            //                 builder: (context) => Chat_screen(
            //                       docid: data[index].doc_id,
            //                     )));
            //           },
            //           child: Container(
            //             //height: 120,
            //             child: Column(
            //               children: <Widget>[
            //                 ListTile(
            //                   leading: Container(
            //                     width: 60,
            //                     child:
            //                     Icon(Icons.account_circle_sharp,
            //                       size: 50,
            //                       color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
            //                     ),
            //
            //                     // Image.network(
            //                     //   data[index].image_name,
            //                     //   fit: BoxFit.cover,
            //                     // ),
            //                   ),
            //                   title: Text(
            //                     data[index].name,
            //                     maxLines: 1,
            //                     overflow: TextOverflow.ellipsis,
            //                     softWrap: false,
            //                   ),
            //                   subtitle: Text("Product: " + data[index].product,
            //                     maxLines: 1,
            //                     overflow: TextOverflow.ellipsis,
            //                     softWrap: false,),
            //                   trailing: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text(tdata),
            //                       Container(
            //
            //                         width:30,
            //                       height: 30,
            //                       color: Colors.white24,
            //                       child: PopupMenuButton(itemBuilder: (context) => [PopupMenuItem(child: Text("Delete Chat"),value: 1,)],
            //
            //                       ),)
            //                     ],
            //                   ),
            //                 ),
            //                 Container(
            //                   //color: Colors.black,
            //                   alignment: Alignment.centerRight,
            //                   //alignment: Alignment(1.0, 0.0),
            //                   child: PopupMenuButton(
            //
            //                       icon: Icon(Icons.more_vert_rounded),
            //                       itemBuilder: (context) => [
            //                             PopupMenuItem(
            //                               child: Text("Delete Chat"),
            //                               value: 1,
            //                             ),
            //                           ]),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ));
            //   }),
            //   padding: EdgeInsets.all(10),
            // )),

            Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return Card(
                        elevation: 3,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Chat_screen(
                                  docid: data[index].doc_id,
                                )));
                          },
                          child: Container(
                            //height: 120,
                            child: Column(
                              children: <Widget>[

                                 ListTile(
                                    leading: Container(
                                      width: 60,
                                      child:
                                      Icon(Icons.account_circle_sharp,
                                        size: 50,
                                        //color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                        color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                                      ),

                                      // Image.network(
                                      //   data[index].image_name,
                                      //   fit: BoxFit.cover,
                                      // ),
                                    ),
                                    title: Text(
                                      data[index].name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    ),
                                    subtitle: Text("Product: " + data[index].product,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,),
                                    trailing:
                                    // Column(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                        Text(tdata),
                                        // Container(
                                        //
                                        //   width:30,
                                        //   height: 30,
                                        //   color: Colors.white24,
                                        //   child: PopupMenuButton(itemBuilder: (context) => [PopupMenuItem(child: Text("Delete Chat"),value: 1,)],
                                        //
                                        //   ),)
                         //             ],
                           //         ),
                                  ),


                                // Container(
                                //   //color: Colors.black,
                                //   alignment: Alignment.centerRight,
                                //   //alignment: Alignment(1.0, 0.0),
                                //   child: PopupMenuButton(
                                //
                                //       icon: Icon(Icons.more_vert_rounded),
                                //       itemBuilder: (context) => [
                                //         PopupMenuItem(
                                //           child: Text("Delete Chat"),
                                //           value: 1,
                                //         ),
                                //       ]),
                                // ),
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
      {required this.name,
      required this.product,
      required this.image_name,
      required this.doc_id});
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
