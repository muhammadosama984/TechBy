import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/screens/productDetails/SearchResult.dart';

import '../database/ads.dart';

class Price extends StatefulWidget {
  final List<ads> priceList;
  const Price({Key? key, required this.priceList}) : super(key: key);

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  TextEditingController min = TextEditingController();
  TextEditingController max = TextEditingController();
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
              // Container(
              //   margin: EdgeInsets.only(left: 70, right: 70),
              //   child: TextFormField(
              //     controller: location,
              //     decoration: InputDecoration(hintText: "Location"),
              //   ),
              // ),
              // SizedBox(
              //   height: 100,
              // ),
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
                      keyboardType: TextInputType.number,
                      controller: min,
                      decoration: InputDecoration(hintText: "Min Price"),
                    ),
                  ),
                  Text("to"),
                  Container(
                    width: 100,
                    height: 30,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: max,
                      decoration: InputDecoration(hintText: "Max Price"),
                    ),
                  ),
                ],
              ),
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
                              categoryList: context.read<adsList>().priceSort(
                                  widget.priceList,
                                  int.parse(min.text),
                                  int.parse(max.text)),
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
