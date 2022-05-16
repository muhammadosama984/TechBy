import 'package:flutter/material.dart';
import 'package:techby/screens/NavBar/navBarNavigation.dart';

class login_btn_temp extends StatefulWidget {
  const login_btn_temp({Key? key}) : super(key: key);

  @override
  _login_btn_tempState createState() => _login_btn_tempState();
}

class _login_btn_tempState extends State<login_btn_temp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => navBarNavigation()));
        },
        child: Text('Temp'),
      ),
    );
  }
}
