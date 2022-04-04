import 'package:flutter/material.dart';

class Chat_screen extends StatefulWidget {
  const Chat_screen({Key? key}) : super(key: key);

  @override
  State<Chat_screen> createState() => _Chat_screenState();
}

class _Chat_screenState extends State<Chat_screen> {
  List<ChatMessage> data = [
    ChatMessage(message: "Hi", messagetype: "sender"),
    ChatMessage(message: "Hello", messagetype: "reciever"),
    ChatMessage(message: "Rates?", messagetype: "sender"),
    ChatMessage(message: "Please Wait", messagetype: "reciever"),
  ];

  TextEditingController _message = new TextEditingController();
  ScrollController _scrollController =
      new ScrollController(keepScrollOffset: true);

  @override
  Widget build(BuildContext context) {
    _scrolltobottom();
    return Scaffold(
      appBar: AppBar(
        title: Text("Ashar"),
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
    );
  }

  addMessage(String input) {
    _message.text = "";
    data.add(ChatMessage(message: input, messagetype: "sender"));
    setState(() {});
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

  ChatMessage({required this.message, required this.messagetype});
}
