import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/Sign%20_In/google_sign_in.dart';
import 'package:techby/database/ads.dart';
import 'package:techby/database/savedAdsList.dart';
import 'package:techby/screens/SearchResult.dart';
import 'package:techby/widgets/Search.dart';

import '../../../database/adsList.dart';
import '../../ProductDetail.dart';
import '../../signIn pages/notification_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;
  String email = "";

  void initState() {
    // TODO: implement initState

    super.initState();
    getTasks();
  }

  getTasks() async {
    isLoading = true;
    setState(() {});
    await context.read<adsList>().getAds();
    email = await Provider.of<GoogleSingInProvider>(context, listen: false)
        .emailAddress();
    await context.read<savedAdsList>().getMyAds(emailAddress: email);
    await context
        .read<adsList>()
        .get_savedAds_ads(context.read<savedAdsList>().ListOfsavedAds);

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
              NotificationApi.showNotification(
                  title: 'Osama', body: 'This is body', payload: '');
            },
            icon: Icon(Icons.notifications),
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context) => SearchPage()));
          //     setState(() {});
          //     //new screen navigate
          //   },
          //   icon: Icon(Icons.search),
          // ),
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
              children: <Widget>[
                browseProduct(),
                categories(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                suggestedProdText(),
                SizedBox(
                  height: 40,
                ),
                Grid(),
              ],
            ),
          ),
        ),
      ),
    );
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
        SizedBox(height: 15),
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
          _desktop(),
          _mobile(),
          _laptop(),
          _camera(),
          _monitor(),
          _speaker(),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

class _desktop extends StatelessWidget {
  const _desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: Center(
        child: GestureDetector(
          onTap: () async {
            List<ads> passingAd = await context
                .read<adsList>()
                .categoryAds(context.read<adsList>().ListOfAds, "Desktop",
                context.read<savedAdsList>().ListOfsavedAds);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ParticularProduct(
                  categoryList: passingAd,
                ),
              ),
            );
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
            ),
          ),
        ),
      ),
    );
  }
}

class _mobile extends StatelessWidget {
  const _mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: GestureDetector(
        onTap: () async {
          List<ads> passingAd = await context.read<adsList>().categoryAds(
              context.read<adsList>().ListOfAds,
              "Mobile",
              context.read<savedAdsList>().ListOfsavedAds);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ParticularProduct(
                categoryList: passingAd,
              ),
            ),
          );
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
        ),
      ),
    );
  }
}

class _laptop extends StatelessWidget {
  const _laptop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: GestureDetector(
          onTap: () async {
            List<ads> passingAd = await context
                .read<adsList>()
                .categoryAds(context.read<adsList>().ListOfAds, "Laptop",
                context.read<savedAdsList>().ListOfsavedAds);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ParticularProduct(
                  categoryList: passingAd,
                ),
              ),
            );
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
          )),
    );
  }
}

class _camera extends StatelessWidget {
  const _camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: GestureDetector(
        onTap: () async {
          List<ads> passingAd = await context.read<adsList>().categoryAds(
              context.read<adsList>().ListOfAds,
              "Camera",
              context.read<savedAdsList>().ListOfsavedAds);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ParticularProduct(
                categoryList: passingAd,
              ),
            ),
          );
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
        ),
      ),
    );
  }
}

class _monitor extends StatelessWidget {
  const _monitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: GestureDetector(
        onTap: () async {
          List<ads> passingAd = await context.read<adsList>().categoryAds(
              context.read<adsList>().ListOfAds,
              "Monitor",
              context.read<savedAdsList>().ListOfsavedAds);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ParticularProduct(
                categoryList: passingAd,
              ),
            ),
          );
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
        ),
      ),
    );
  }
}

class _speaker extends StatelessWidget {
  const _speaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: GestureDetector(
        onTap: () async {
          List<ads> passingAd = await context.read<adsList>().categoryAds(
              context.read<adsList>().ListOfAds,
              "Speaker",
              context.read<savedAdsList>().ListOfsavedAds);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ParticularProduct(
                categoryList: passingAd,
              ),
            ),
          );
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
    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: context.read<adsList>().ListOfAds.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
        });
  }
}
