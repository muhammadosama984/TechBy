import 'package:flutter/material.dart';
import 'widgets/adList.dart';

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
        automaticallyImplyLeading: false,
      ),
      body: myAds(),
    );
  }
}
