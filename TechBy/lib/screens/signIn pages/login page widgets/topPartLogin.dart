import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class topPartLogin extends StatefulWidget {
  const topPartLogin({Key? key}) : super(key: key);

  @override
  _topPartLoginState createState() => _topPartLoginState();
}

class _topPartLoginState extends State<topPartLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 0,
        ),
        Container(
            width: 250,
            margin: const EdgeInsets.only(left: 0, right: 10),
            child:
            const Image(image: const AssetImage('assets/TBiconLong.png'))),
        const SizedBox(
          height: 40,
        ),
        const CircleAvatar(
          radius: 61,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/googleRounded.png'),
          child: CircleAvatar(
            backgroundColor: Color(0xffE6E6E6),
            radius: 58,
            child: Icon(
              Icons.person,
              size: 80,
              color: Color(0xffCCCCCC),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),

        Center(
          child: Text(
            "Enter in to the world of Tech",
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
