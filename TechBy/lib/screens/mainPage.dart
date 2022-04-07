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
      height: 180,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _desktop(),
            _mobile(),
            _laptop(),
            _camera(),
            _monitor(),
            _speaker(),

          ],
        ),
      ),

    );
  }
}
class _desktop extends StatelessWidget {
  const _desktop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                    image: AssetImage('assets/desktop.png'),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.rectangle,
                ),
                //child: Text("Desktop"),
              ),
            ),
          ),
          Text(
            "Desktop",
            style: TextStyle(
              //color: Colors.blue,
              //fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 18,
              //decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}
class _mobile extends StatelessWidget {
  const _mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                    image: AssetImage('assets/smartphone.png'),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.rectangle,
                ),
                //child: Text("Desktop"),
              ),
            ),
          ),
          Text(
            "Mobiles",
            style: TextStyle(
              //color: Colors.blue,
              //fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 18,
              //decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}
class _laptop extends StatelessWidget {
  const _laptop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                    image: AssetImage('assets/laptop.png'),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ),
          Text(
            "Laptop",
            style: TextStyle(
              //color: Colors.blue,
              //fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 18,
              //decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}
class _camera extends StatelessWidget {
  const _camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                    image: AssetImage('assets/camera.png'),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ),
          Text(
            "Camera",
            style: TextStyle(
              //color: Colors.blue,
              //fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 18,
              //decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}

class _monitor extends StatelessWidget {
  const _monitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                    image: AssetImage('assets/monitor.png'),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ),
          Text(
            "Monitor",
            style: TextStyle(
              //color: Colors.blue,
              //fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 18,
              //decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}

class _speaker extends StatelessWidget {
  const _speaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                    image: AssetImage('assets/speaker.png'),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ),
          Text(
            "Speaker",
            style: TextStyle(
              //color: Colors.blue,
              //fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 18,
              //decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}

class _container_1_categories extends StatelessWidget {
  const _container_1_categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _desktop(),
            _mobile(),
            _laptop(),
          ],
        ),
      ),
    );
  }
}
