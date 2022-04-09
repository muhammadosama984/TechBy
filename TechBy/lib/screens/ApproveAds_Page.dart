import 'package:flutter/material.dart';

class Approveads_screen extends StatefulWidget {
  const Approveads_screen({Key? key}) : super(key: key);

  @override
  State<Approveads_screen> createState() => _Approveads_screenState();
}

class _Approveads_screenState extends State<Approveads_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyAds"),
      ),
      body: _adsList(),
    );
  }
}

class _adsList extends StatefulWidget {
  const _adsList({Key? key}) : super(key: key);

  @override
  _adsListState createState() => _adsListState();
}

class _adsListState extends State<_adsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) {
          return Card(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 130,
                child: ListTile(
                  leading: Image(image: AssetImage('assets/TBicon.jpeg')),
                  title: Text(
                    "Title\n",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Rs: Price \nYear: 2022 "),
                  trailing: PopupMenuButton(
                    icon: Icon(Icons.more_vert_rounded),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {},
                        child: Text("Change"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        onTap: () {},
                        child: Text("Remove"),
                        value: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

