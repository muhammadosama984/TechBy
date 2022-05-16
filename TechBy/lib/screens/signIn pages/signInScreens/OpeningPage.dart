import 'package:flutter/material.dart';
import 'package:techby/screens/signIn%20pages/signInScreens/Signup_Page.dart';
import '../OpeningPage widgets/getStartbtn.dart';
import '../OpeningPage widgets/techbyLogo.dart';
import 'notification_api.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationApi.init();
    listenNotification();
  }

  void listenNotification() {
    NotificationApi.onNotification.stream.listen(onClick);
  }

  void onClick(String? payload) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Signup_screen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: const [
            techByLogo(),
            getStart_btn(),
          ],
        )),
      ),
    );
  }
}

