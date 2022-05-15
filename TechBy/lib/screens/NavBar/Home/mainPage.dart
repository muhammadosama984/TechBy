import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/screens/SearchResult.dart';
import 'package:techby/widgets/Search.dart';

import '../../../database/adsList.dart';
import '../../ProductDetail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;
  void initState() {
    // TODO: implement initState

    super.initState();
    getTasks();
  }

  getTasks() async {
    isLoading = true;
    setState(() {});
    await context.read<adsList>().getAds();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(30, 159, 217, 1),
          title: Image.asset(
            'assets/TBweb.png',
            fit: BoxFit.cover,
            color: Colors.white,
            width: 100,
          ),
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchPage()));
                setState(() {});
                //new screen navigate
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Card(
              child: ListView(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                //crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  browseProduct(),
                  categories(),
                  SizedBox(
                    height: 20,
                  ),
                  suggestedProdText(),
                  SizedBox(
                    height: 20,
                  ),
                  Grid(),
                ],
              ),
            ),
          ),
          // body: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: <Widget>[
          //     browseProduct(),
          //     categories(),
          //     Grid(),
          //   ],
          // ),
          //bottomNavigationBar: bottomNavBar(),
        ));
  }
}

class browseProduct extends StatelessWidget {
  const browseProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 25),
        Container(
          width: 300,
          child: Image(
            image: AssetImage('assets/TBiconLong.png'),
          ),
        ),

        SizedBox(height: 40),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 180, 0),
          child: Text(
            "Browse Categories",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        //
        // SizedBox(height: 20),
        // Text(
        //   "     Categories",
        //   style: TextStyle(
        //     fontSize: 18,
        //     color: Colors.blue,
        //     fontFamily: 'Montserrat',
        //   ),
        // ),
        SizedBox(height: 15),
        // Text("data"),
      ],
    );
  }
}

class categories extends StatefulWidget {
  const categories({Key? key}) : super(key: key);

  @override
  _categoriesState createState() => _categoriesState();
}

// class _categoriesState extends State<categories> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 125,
//       child: ListView.builder(
//         shrinkWrap: true,
//         physics: ClampingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemCount: 6,
//         //children: <Widget>[
//         itemBuilder: (BuildContext context, int index) => Card(
//           child: Center(
//             child: GestureDetector(
//               onTap: () async {
//                 await context.read<adsList>().getAds();
//
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => ParticularProduct(
//                           categoryList: context.read<adsList>().categoryAds(
//                               context.read<adsList>().ListOfAds, "Desktop"),
//                         )));
//               },
//               child: Center(
//                 child: Container(
//                   margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                   height: 120.0,
//                   width: 120.0,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/desktop.png'),
//                       fit: BoxFit.contain,
//                     ),
//                     shape: BoxShape.rectangle,
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.only(left:35, bottom: 0, right: 0, top:95), //apply padding to some sides only
//                     child: Text("Desktop"),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           //child: listItem(context, index),
//           //Center(child: Text('Dummy Card Text')),
//         ),
//         //listItem(context, index),
//       ),
//       //],
//       //  ),
//     );
//   }
// }

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Card(
              color: Colors.white70,
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    await context.read<adsList>().getAds();

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ParticularProduct(
                              categoryList: context.read<adsList>().categoryAds(
                                  context.read<adsList>().ListOfAds, "Desktop"),
                            )));
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      height: 120.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/desktop.png'),
                          fit: BoxFit.contain,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                      // child: Padding(
                      //   padding: EdgeInsets.only(
                      //       left: 35,
                      //       bottom: 0,
                      //       right: 0,
                      //       top: 95), //apply padding to some sides only
                      //   child: Text("Desktop"),
                      // ),
                    ),
                  ),
                ),
              ),
              //child: listItem(context, index),
              //Center(child: Text('Dummy Card Text')),
            ),
            Card(
              color: Colors.white70,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ParticularProduct(
                            categoryList: context.read<adsList>().categoryAds(
                                context.read<adsList>().ListOfAds, "Mobile"),
                          )));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(05, 10, 05, 10),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/mobile.png'),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  // child: Padding(
                  //   padding: EdgeInsets.only(
                  //       left: 35,
                  //       bottom: 0,
                  //       right: 0,
                  //       top: 95), //apply padding to some sides only
                  //   child: Text(
                  //     "Mobile",
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ), //child: Text("Desktop"),
                ),
              ),
            ),
            Card(
              color: Colors.white70,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ParticularProduct(
                              categoryList: context.read<adsList>().categoryAds(
                                  context.read<adsList>().ListOfAds, "Laptop"),
                            )));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/laptop.png'),
                        fit: BoxFit.contain,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    // child: Padding(
                    //   padding: EdgeInsets.only(
                    //       left: 35,
                    //       bottom: 0,
                    //       right: 0,
                    //       top: 95), //apply padding to some sides only
                    //   child: Text(
                    //     "Laptop",
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    // ),
                  )),
            ),
            Card(
              color: Colors.white70,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ParticularProduct(
                            categoryList: context.read<adsList>().categoryAds(
                                context.read<adsList>().ListOfAds, "Camera"),
                          )));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/camera.png'),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  // child: Padding(
                  //   padding: EdgeInsets.only(
                  //       left: 35,
                  //       bottom: 0,
                  //       right: 0,
                  //       top: 95), //apply padding to some sides only
                  //   child: Text(
                  //     "Camera",
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                ),
              ),
            ),
            Card(
              color: Colors.white70,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ParticularProduct(
                            categoryList: context.read<adsList>().categoryAds(
                                context.read<adsList>().ListOfAds, "Monitor"),
                          )));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/monitor.png'),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  // child: Padding(
                  //   padding: EdgeInsets.only(
                  //       left: 35,
                  //       bottom: 0,
                  //       right: 0,
                  //       top: 95), //apply padding to some sides only
                  //   child: Text(
                  //     "Monitor",
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                ),
              ),
            ),
            Card(
              color: Colors.white70,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ParticularProduct(
                            categoryList: context.read<adsList>().categoryAds(
                                context.read<adsList>().ListOfAds, "Speaker"),
                          )));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/speaker.png'),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  // child: Padding(
                  //   padding: EdgeInsets.only(
                  //       left: 35,
                  //       bottom: 0,
                  //       right: 0,
                  //       top: 95), //apply padding to some sides only
                  //   child: Text(
                  //     "Speaker",
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ]
          //listItem(context, index),
          ),
      //],
      //  ),
    );
  }
}

class _desktop extends StatelessWidget {
  const _desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          Card(
            child: GestureDetector(
              onTap: () async {
                await context.read<adsList>().getAds();

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ParticularProduct(
                          categoryList: context.read<adsList>().categoryAds(
                              context.read<adsList>().ListOfAds, "Desktop"),
                        )));
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
            "Desktops",
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
      child: ListView(
        children: <Widget>[
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ParticularProduct(
                          categoryList: context.read<adsList>().categoryAds(
                              context.read<adsList>().ListOfAds, "Mobile"),
                        )));
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
      child: ListView(
        children: <Widget>[
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ParticularProduct(
                          categoryList: context.read<adsList>().categoryAds(
                              context.read<adsList>().ListOfAds, "Laptop"),
                        )));
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
      child: ListView(
        children: <Widget>[
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ParticularProduct(
                          categoryList: context.read<adsList>().categoryAds(
                              context.read<adsList>().ListOfAds, "Camera"),
                        )));
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
      child: ListView(
        children: <Widget>[
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ParticularProduct(
                          categoryList: context.read<adsList>().categoryAds(
                              context.read<adsList>().ListOfAds, "Monitor"),
                        )));
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
      child: ListView(
        children: <Widget>[
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ParticularProduct(
                          categoryList: context.read<adsList>().categoryAds(
                              context.read<adsList>().ListOfAds, "Speaker"),
                        )));
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

class suggestedProdText extends StatefulWidget {
  const suggestedProdText({Key? key}) : super(key: key);

  @override
  State<suggestedProdText> createState() => _suggestedProdTextState();
}

class _suggestedProdTextState extends State<suggestedProdText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(
        "Browse Products",
        style: TextStyle(
            fontSize: 16,
            fontFamily: "montserrat",
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    //return Expanded(
    return GridView.builder(
//      child: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: context.read<adsList>().ListOfAds.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
                elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: InkWell(
              onTap: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetail(
                          Ads: context.read<adsList>().ListOfAds[index],
                        )));
              }),
              child: GridTile(
                footer: Container(
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.black)),
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      context.read<adsList>().ListOfAds[index].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle:
                        Text(context.read<adsList>().ListOfAds[index].price),
                  ),
                ),
                child: Image.network(
                  context.read<adsList>().ListOfAds[index].downloadURLS[0],
                  fit: BoxFit.fill,
                ),
              ),
            ),

          );
        }
        //),
        );
  }
}
