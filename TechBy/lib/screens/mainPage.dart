import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techby/screens/Admin_Page.dart';
import 'package:techby/screens/ChatMain_page.dart';
import 'package:techby/screens/More_Page.dart';
import 'package:techby/screens/PostAds.dart';
import 'package:techby/screens/SearchResult.dart';
import 'package:techby/screens/ViewMyAds.dart';
import 'package:techby/widgets/Search.dart';
import 'package:techby/widgets/bottomBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TechBy"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              //new screen navigate
            },
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage()));
              setState(() {});
              //new screen navigate
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[browseProduct(), categories()],
      ),
      //bottomNavigationBar: bottomNavBar(),
    );
  }
}

class browseProduct extends StatelessWidget {
  const browseProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          "   Tagline",
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 60),
        Text(
          "   Browse Products",
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        Text(
          "     Category",
          style: TextStyle(fontSize: 18, color: Colors.blue),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class categories extends StatefulWidget {
  const categories({Key? key}) : super(key: key);

  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ParticularProduct()));
                },
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/pc.png'),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  //child: Text("Desktop"),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ParticularProduct()));
                },
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/smartphone.png'),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  //child: Text("Desktop"),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ParticularProduct()));
                },
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/laptop.png'),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
