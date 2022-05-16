import 'package:flutter/material.dart';

class techByLogo extends StatelessWidget {
  const techByLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        margin: const EdgeInsets.only(bottom: 23, top: 260, left: 0, right: 13),
        child: Column(children: const [
          Image(image: AssetImage('assets/TBiconLong.png')),
          SizedBox(
            height: 150,
          ),
        ]));
  }
}
