import 'package:flutter/material.dart';
import 'package:techby/widgets/Listview.dart';

import '../database/ads.dart';

class SearchPage extends StatefulWidget {
  List<ads> searchList;
  SearchPage({Key? key, required this.searchList}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ads> newList = [];
  void searchResult(String val) {
    List<ads> newList = [];
    for (int i = 0; i < widget.searchList.length; i++) {
      if (widget.searchList[i].title == val) {
        newList.add(widget.searchList[i]);
      }
    }
    widget.searchList = newList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newList = widget.searchList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            onChanged: (value) {
              newList = widget.searchList
                  .where(((element) => (element.title.contains(value))))
                  .toList();
              setState(() {});
            },
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
      body: Lists(comingList: newList),
    );
  }
}
