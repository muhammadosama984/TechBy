import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';
import 'package:techby/screens/NavBar/navBarNavigation.dart';

class googleSignIn extends StatefulWidget {
  const googleSignIn({Key? key}) : super(key: key);

  @override
  State<googleSignIn> createState() => _googleSignInState();
}

class _googleSignInState extends State<googleSignIn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Provider.of<GoogleSingInProvider>(context, listen: false)
            .googleLogin();
        if (context.read<GoogleSingInProvider>().signInDone) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>  navBarNavigation()));
        }
      },
      child: Container(
        width: 280,
        height: 60,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(35)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: Image(image: AssetImage('assets/google.png'))),
            SizedBox(width: 10),
            Text(
              "Continue with Google",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
