import 'package:flutter/material.dart';

class ViewMyAds extends StatefulWidget {
  const ViewMyAds({Key? key}) : super(key: key);

  @override
  State<ViewMyAds> createState() => _ViewMyAdsState();
}

class _ViewMyAdsState extends State<ViewMyAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MyAds"),
        ),
        body: Container(
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                                )
                              ]),
                    ),
                  ),
                ));
              })),
        ));
  }
}
