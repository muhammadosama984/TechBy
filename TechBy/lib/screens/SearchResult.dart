import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/widgets/Listview.dart';
import 'package:techby/widgets/Search.dart';
import 'package:techby/screens/Filter.dart';
import 'package:provider/provider.dart';

import '../database/ads.dart';

class ParticularProduct extends StatefulWidget {
  final List<ads> categoryList;
  const ParticularProduct({Key? key, required this.categoryList})
      : super(key: key);

  @override
  State<ParticularProduct> createState() => _ParticularProductState();
}

class _ParticularProductState extends State<ParticularProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => SearchPage(
                        searchList: widget.categoryList,
                      ))),
              icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => filter()));
                },
                child: Container(
                  width: 70,
                  child: Center(
                    child: Text(
                      "Filter",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 70,
                  child: Center(
                    child: Text(
                      "Price",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 70,
                  child: Center(
                    child: Text(
                      "Brand",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(child: Lists(comingList: widget.categoryList))
        ],
      ),
    );
  }
}
