import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';

class topPart extends StatefulWidget {
  const topPart({Key? key}) : super(key: key);

  @override
  _topPartState createState() => _topPartState();
}

class _topPartState extends State<topPart> {
  void printThings() async {
    print(await Provider.of<GoogleSingInProvider>(context, listen: false)
        .emailAddress());
    print(await Provider.of<GoogleSingInProvider>(context, listen: false)
        .userName());
    print(await Provider.of<GoogleSingInProvider>(context, listen: false)
        .photoUrl());
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            Provider.of<GoogleSingInProvider>(context, listen: false)
                .userDetails
                .profilePic
                .toString(),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                  Provider.of<GoogleSingInProvider>(context, listen: false)
                      .userDetails
                      .userName
                      .toString(),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
