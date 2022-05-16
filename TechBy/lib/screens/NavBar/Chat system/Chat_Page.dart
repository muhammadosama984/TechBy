import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../Sign _In/google_sign_in.dart';

class Chat_screen extends StatefulWidget {
  String docid;
  Chat_screen({required this.docid});

  // Chat_screen(){required this.docid};
  @override
  State<Chat_screen> createState() => _Chat_screenState();
}

class _Chat_screenState extends State<Chat_screen> {
  Timer? timer;
  String other_email = "";
  void initState() {
    super.initState();
    // print(widget.docid);
    getChat();

    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getChatRuntime());
  }

  @override
  void deactivate() {
    timer?.cancel();
    super.deactivate();
  }

  @override
  void activate() {
    getChat();

    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getChatRuntime());
    super.activate();
  }

  // Future<void> socketSetup() async {
  //   email = await Provider.of<GoogleSingInProvider>(
  //       context, listen: false).emailAddress();
  //
  //   final Map<String, dynamic> chatData = {};
  //   chatData['doc'] = widget.docid;
  //   chatData['sender'] = email;
  //
  //   IO.Socket socket = IO.io('http://localhost:5000');
  //   socket.onConnect((_) {
  //     print('connect');
  //     socket.emit('start_chat', chatData);
  //   });
  //
  //
  //   );
  // }

  void messagecreation(List<dynamic> room, String email) async {
    for (var messagedoc in room) {
      await FirebaseFirestore.instance
          .collection('Rooms')
          .doc(messagedoc)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        var message = documentSnapshot.data() as Map;
        if (email == message["sender"])
          data.add(ChatMessage(
              message: message["message"],
              messagetype: "sender",
              sender: message["sender"],
              docid: documentSnapshot.id));
        else
          data.add(ChatMessage(
              message: message["message"],
              messagetype: "reciever",
              sender: message["sender"],
              docid: documentSnapshot.id));
      });
    }
    if (mounted) setState(() {});
  }

  void getChatRuntime() async {
    String email =
        await Provider.of<GoogleSingInProvider>(context, listen: false)
            .emailAddress();

    await FirebaseFirestore.instance
        .collection('Userrooms')
        .doc(widget.docid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      var useroomMap = documentSnapshot.data() as Map;
      List<dynamic> room = useroomMap["room"];

      print(room);

      data.clear();

      messagecreation(room, email);

      // room.forEach((messagedoc) async {
      //   await FirebaseFirestore.instance.collection('Rooms').doc(messagedoc).get()
      //       .then((DocumentSnapshot documentSnapshot) {
      //
      //       var message = documentSnapshot.data() as Map;
      //       if (email == message["sender"])
      //         data.add(ChatMessage(message: message["message"],
      //             messagetype: "sender",
      //             sender: message["sender"],
      //             docid: documentSnapshot.id));
      //       else
      //         data.add(ChatMessage(message: message["message"],
      //             messagetype: "reciever",
      //             sender: message["sender"],
      //             docid: documentSnapshot.id));
      //
      //     });
      //   });
    });
  }

  void getChat() async {
    String email =
        await Provider.of<GoogleSingInProvider>(context, listen: false)
            .emailAddress();
    await FirebaseFirestore.instance
        .collection('Userrooms')
        .doc(widget.docid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      var useroomMap = documentSnapshot.data() as Map;
      List<dynamic> room = useroomMap["room"];
      if (email == useroomMap["buyerid"])
        other_email = useroomMap["sellerid"];
      else
        other_email = useroomMap["buyerid"];

      messagecreation(room, email);
    });
  }
  //
  // IO.Socket socket = IO.io('http://localhost:5000');
  //
  // socket.on("get_msg", (msg) {
  //   data.add(ChatMessage.fromJson(msg));
  //   setState(() {});
  // });

  String email = "";

  List<ChatMessage> data = [
    // ChatMessage(message: "Hi", messagetype: "sender"),
    // ChatMessage(message: "Hello", messagetype: "reciever"),
    // ChatMessage(message: "Rates?", messagetype: "sender"),
    // ChatMessage(message: "Please Wait", messagetype: "reciever"),
  ];

  TextEditingController _message = new TextEditingController();
  ScrollController _scrollController =
      new ScrollController(keepScrollOffset: true);

  @override
  Widget build(BuildContext context) {
    _scrolltobottom();
    return Scaffold(
      appBar: AppBar(
        title: Text(other_email),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //Container(height: 10,),
            _messageSpace(),
            _inputSpace()
          ],
        ),
      ),
    );
  }

  Widget _messageSpace() {
    // return Container(
    //   width: double.infinity,
    //    height: 600,
    //   color: Colors.red,
    // );
    return Flexible(
        child: SingleChildScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            child: ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (data[index].messagetype == "reciever")
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (data[index].messagetype == "reciever")
                                ? Colors.grey.shade200
                                : Colors.blueAccent.shade100),
                        child: Text(data[index].message),
                      ),
                    ),
                  );
                })));
  }

  Widget _inputSpace() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 60,
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            controller: _message,
            onSubmitted: (String str) {
              addMessage(_message.text);
            },
            decoration: InputDecoration(
                hintText: "Type Message", border: InputBorder.none),
          )),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    _openImagePicker();
                  },
                  icon: Icon(Icons.attachment)),
              FloatingActionButton(
                  onPressed: () {
                    addMessage(_message.text);
                  },
                  child: Icon(
                    Icons.send_sharp,
                    color: Colors.white,
                    size: 15,
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _openImagePicker() async {
    File? _image;
    final _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      if (mounted)
        setState(() {
          _image = File(pickedImage.path);
        });
    }
  }

  addMessage(String input) async {
    String email =
        await Provider.of<GoogleSingInProvider>(context, listen: false)
            .emailAddress();
    _message.text = "";

    ChatMessage obj = ChatMessage(
        message: input, messagetype: "sender", sender: email, docid: '');

    await FirebaseFirestore.instance
        .collection('Rooms')
        .add(obj.toJson())
        .then((value) async {
      obj.docid = value.id;
      await FirebaseFirestore.instance
          .collection("Userrooms")
          .doc(widget.docid)
          .update({
        "room": FieldValue.arrayUnion([value.id]),
      });
    });
  }

  _scrolltobottom() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }
}

class ChatMessage {
  final String message;
  final String messagetype;
  final String sender;
  String docid;
  DateTime dt = DateTime.now();

  ChatMessage(
      {required this.message,
      required this.messagetype,
      required this.sender,
      required this.docid});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = this.message;
    data['sender'] = this.sender;
    data['datetime'] = this.dt;
    return data;
  }

  Map<String, dynamic> toIOJson() {
    final Map<String, dynamic> data = {};
    data['message'] = this.message;
    data['sender'] = this.sender;
    data['messagetype'] = "reciever";
    return data;
  }
}

//   static ChatMessage fromJson(Map<String, dynamic> json) => ChatMessage(
//       message: json['message'],
//       sender: json['sender'],
//       messagetype: json['messagetype']);
// }
