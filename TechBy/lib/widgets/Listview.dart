import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:techby/screens/ProductDetail.dart';

class List extends StatefulWidget {
  const List({Key? key}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProductDetail()));
                },
                child: Container(
                  height: 130,
                  child: ListTile(
                      leading: Image(image: AssetImage('assets/TBicon.jpeg')),
                      title: Text(
                        "Title\n",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Rs: Price \nYear: 2022 "),
                      trailing: FavoriteButton(valueChanged: () {})),
                ),
              ),
            );
          })),
    );
  }
}
