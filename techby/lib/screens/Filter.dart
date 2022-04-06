import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class filter extends StatefulWidget {
  const filter({Key? key}) : super(key: key);

  @override
  State<filter> createState() => _filterState();
}

class _filterState extends State<filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Items"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 70, right: 70),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Location"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.price_change,
                size: 35,
              ),
              Text("Price Range"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 30,
                child: TextField(
                  decoration: InputDecoration(hintText: "Min Price"),
                ),
              ),
              Text("to"),
              Container(
                width: 100,
                height: 30,
                child: TextField(
                  decoration: InputDecoration(hintText: "Max Price"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
