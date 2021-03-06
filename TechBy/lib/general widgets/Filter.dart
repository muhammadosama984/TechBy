import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/screens/productDetails/SearchResult.dart';

import '../database/ads.dart';

class filter extends StatefulWidget {
  final List<ads> filterList;
  const filter({Key? key, required this.filterList}) : super(key: key);

  @override
  State<filter> createState() => _filterState();
}

class _filterState extends State<filter> {
  TextEditingController location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Items"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 50, top: 30),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 70, right: 70),
                child: TextFormField(
                  controller: location,
                  decoration: InputDecoration(hintText: "City"),
                ),
              ),
              // SizedBox(
              //   height: 100,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(
              //       Icons.price_change,
              //       size: 35,
              //     ),
              //     Text("Price Range"),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Container(
              //       width: 100,
              //       height: 30,
              //       child: TextField(
              //         decoration: InputDecoration(hintText: "Min Price"),
              //       ),
              //     ),
              //     Text("to"),
              //     Container(
              //       width: 100,
              //       height: 30,
              //       child: TextField(
              //         decoration: InputDecoration(hintText: "Max Price"),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 100,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(
              //       Icons.calendar_today,
              //       size: 35,
              //     ),
              //     Text("Model Year"),
              //   ],
              // ),
              // SizedBox(
              //   height: 4,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Container(
              //       width: 100,
              //       height: 30,
              //       child: TextField(
              //         decoration: InputDecoration(hintText: "2000"),
              //       ),
              //     ),
              //     Text("to"),
              //     Container(
              //       width: 100,
              //       height: 30,
              //       child: TextField(
              //         decoration: InputDecoration(hintText: "2022"),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 90,
              ),
              ButtonTheme(
                height: 55,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue,
                  onPressed: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ParticularProduct(
                              categoryList: context
                                  .read<adsList>()
                                  .locationSort(
                                      widget.filterList, location.text),
                            )));
                  }),
                  child: Text(
                    "Apply",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
