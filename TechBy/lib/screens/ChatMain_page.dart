import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:techby/screens/Chat_Page.dart';

import '../widgets/Search.dart';

class ChatMain_screen extends StatefulWidget {
  const ChatMain_screen({Key? key}) : super(key: key);

  @override
  State<ChatMain_screen> createState() => _ChatMain_screenState();
}

List<ChatUser> data = [
  ChatUser(
      name: "Ashar",
      product: "IPhone 13 Pro",
      image_name: "assets/smartphone.png"),
  ChatUser(name: "Osama", product: "Desktop", image_name: "assets/desktop.jpg")
];
String tdata = DateFormat("HH:mm").format(DateTime.now());

class _ChatMain_screenState extends State<ChatMain_screen> {
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

class ChatUser {
  String name;
  String product;
  String image_name;

  ChatUser(
      {required this.name, required this.product, required this.image_name});
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
