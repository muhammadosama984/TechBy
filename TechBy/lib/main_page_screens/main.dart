import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techby/screens/Admin_Page.dart';
import 'package:techby/widgets/bottomBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Techby'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              //new screen navigate
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          browseProduct(),
          categories()
        ],
      ),
      bottomNavigationBar: bottomNavBar(),
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
        Text(
          " Tagline",
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 80),
        Text(
          " Browse Products",
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
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
              child: Text("Desktop"),
            ),
          ),
          Card(
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
              child: Text("Desktop"),
            ),
          ),
        ],
      ),
    );
  }
}
