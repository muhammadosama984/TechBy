import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techby/widgets/Listview.dart';
import 'package:techby/widgets/Search.dart';
import 'package:techby/screens/Filter.dart';

class ParticularProduct extends StatefulWidget {
  const ParticularProduct({Key? key}) : super(key: key);

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
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          // Container(
          //   margin: EdgeInsets.only(left: 80, right: 80),
          //   child: TextField(
          //     decoration: InputDecoration(
          //         labelText: 'Search',
          //         suffixIcon:
          //             IconButton(onPressed: () {}, icon: Icon(Icons.search))),
          //   ),
          // ),
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
          Expanded(child: List())
        ],
      ),
    );
  }
}
