import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techby/database/ads.dart';

import '../../Sign _In/google_sign_in.dart';
import '../NavBar/Chat system/Chat_Page.dart';

class ProductDetail extends StatefulWidget {
  final ads Ads;
  const ProductDetail({Key? key, required this.Ads}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  void userEntryToDatabase() async {
    String email =
        await Provider.of<GoogleSingInProvider>(context, listen: false)
            .emailAddress();
    bool userexists = false;
    String docid = "";

    await FirebaseFirestore.instance
        .collection('Userrooms')
        .where('buyerid', isEqualTo: email)
        .where('sellerid', isEqualTo: widget.Ads.emailAddressUser)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        userexists = true;
        docid = doc.id;
      });
    });

    if (!userexists) {
      await FirebaseFirestore.instance
          .collection('Userrooms')
          .where('sellerid', isEqualTo: email)
          .where('buyerid', isEqualTo: widget.Ads.emailAddressUser)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          userexists = true;
          docid = doc.id;
        });
      });
    }

    if (!userexists) {
      final Map<String, dynamic> data = {};
      data['buyerid'] = email;
      data['sellerid'] = widget.Ads.emailAddressUser;
      data['room'] = [];
      data['Image'] = widget.Ads.downloadURLS[0];
      data['Product'] = widget.Ads.title;

      await FirebaseFirestore.instance
          .collection('Userrooms')
          .add(data)
          .then((value) async {
        docid = value.id;

        String buyerdoc = "";
        String sellerdoc = "";

        await FirebaseFirestore.instance
            .collection('Users')
            .where('email', isEqualTo: email)
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            buyerdoc = doc.id;
          });
        });

        // print(buyerdoc);

        await FirebaseFirestore.instance
            .collection('Users')
            .where('email', isEqualTo: widget.Ads.emailAddressUser)
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            sellerdoc = doc.id;
          });
        });

        // print(sellerdoc);

        await FirebaseFirestore.instance
            .collection("Users")
            .doc(buyerdoc)
            .update({
          "rooms": FieldValue.arrayUnion([docid]),
        });

        await FirebaseFirestore.instance
            .collection("Users")
            .doc(sellerdoc)
            .update({
          "rooms": FieldValue.arrayUnion([docid]),
        });
      });
    }

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Chat_screen(docid: docid)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Slider(URLS: widget.Ads.downloadURLS),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text(
                          widget.Ads.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        // Text("PKR Price: " + widget.Ads.price,
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.bold, fontSize: 15)),
                        // SizedBox(
                        //   height: 6,
                        // ),
                        // Text("Location: " + widget.Ads.location),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.location_city_rounded,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text(
                            widget.Ads.location,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      Column(
                        children: [
                          Icon(
                            Icons.price_check_rounded,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text(
                            widget.Ads.price,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      // Column(
                      //   children: [
                      //     Icon(
                      //       Icons.check_circle_outline_rounded,
                      //       size: 35,
                      //       color: Colors.blue,
                      //     ),
                      //     Text(widget.Ads.uploadDate.year + 1 ==
                      //             DateTime.now().year
                      //         ? ("0 year")
                      //         : ("1 year"))
                      //   ],
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      readOnly: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      initialValue: widget.Ads.description,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(12, 2, 12, 10),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        userEntryToDatabase();

                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => Chat_screen(docid: docid)));
                      },
                      child: Container(
                        width: 110,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)),
                        margin: EdgeInsets.symmetric(horizontal: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "chat",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Slider extends StatefulWidget {
  List URLS = [];
  Slider({Key? key, required this.URLS}) : super(key: key);

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 400,
          // viewportFraction: 1,
          reverse: true,
          pageSnapping: false,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          autoPlay: true,
        ),
        itemCount: widget.URLS.length,
        itemBuilder: (context, index, realIndex) {
          final urlImage = widget.URLS[index];
          return buildImage(urlImage, index);
        },
      ),
    );
  }
}

Widget buildImage(String urlImage, int index) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 12),
    color: Colors.grey,
    child: Image.network(
      urlImage,
      fit: BoxFit.cover,
    ),
  );
}
