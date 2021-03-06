import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign%20_In/googleUser.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';
import 'package:techby/database/verrifiedEmailsList.dart';
import 'package:techby/screens/signIn%20pages/signInScreens/OpeningPage.dart';
import '../../NavBar/navBarNavigation.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    _navigatetoHome();
  }
  Future<void> _navigatetoHome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    FirebaseAuth auth = FirebaseAuth.instance;
    final signin = await auth.currentUser;
    await context.read<verifiedEmailsList>().getEmails();

    if (signin != null) {

      print(await signin.photoURL!.toString());
      Provider.of<GoogleSingInProvider>(context, listen: false).userDetails =
          googleUser(email: await signin.email!, userName: await signin.displayName!, profilePic:await signin.photoURL!);
      print(await Provider.of<GoogleSingInProvider>(context, listen: false)
          .userDetails
          .userName.toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => navBarNavigation()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OpeningPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          color: Colors.blue,
          child: TweenAnimationBuilder(
            curve: Curves.bounceOut,
            duration: Duration(milliseconds: 1700),
            tween: Tween<double>(begin: 20, end: 100),
            builder: (BuildContext context, double value, Widget? child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TechBy",
                    style: TextStyle(fontSize: value, color: Colors.white),
                  ),
                  Text(
                    "One Stop Tech Market",
                    style:
                        TextStyle(fontSize: value / 5.0, color: Colors.white),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
