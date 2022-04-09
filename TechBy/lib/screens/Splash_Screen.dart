import 'package:flutter/material.dart';
import 'package:techby/screens/OpeningPage.dart';

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
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OpeningPage()));
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
              return Text(
                "TechBy",
                style: TextStyle(fontSize: value, color: Colors.white),
              );
            },
          ),
        ),
      ),
    );
  }
}
