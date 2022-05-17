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
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color.fromRGBO(30, 159, 217, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          //margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Slider(URLS: widget.Ads.downloadURLS),
              const SizedBox(height: 20),
              Card(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                elevation: 5,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, top: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              widget.Ads.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text("Price: Rs " + widget.Ads.price,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(height: 6),
                          Text("Location: " + widget.Ads.location),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 5),

                            ImageIcon(
                              AssetImage("assets/ruppee_icon.png"),
                              size: 25,
                              color: Colors.black,
                            ),
                            SizedBox(height: 5),
                            // const Icon(
                            //   Icons.image
                            //   Icons.currency_rupee,
                            //
                            // ),
                            Text(
                              widget.Ads.price,
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Column(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              size: 35,
                              color: Colors.red,
                            ),
                            Text(
                              widget.Ads.location,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Column(
                          children: [
                            const Icon(
                              Icons.verified,
                              size: 35,
                              color: Colors.green,
                            ),
                            Text(
                              widget.Ads.uploadDate.year + 1 ==
                                      DateTime.now().year
                                  ? ("Not verified")
                                  : ("Verified"),
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                    //const SizedBox(height: 20),
                    const SizedBox(height: 35),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(05),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      width: 320,
                      padding: EdgeInsets.all(05),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        readOnly: true,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        initialValue: widget.Ads.description,
                        decoration: InputDecoration(

                            //fillColor: Colors.grey[300],

                            //filled: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(12, 2, 2, 2),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Container(
                      //alignment: Alignment.bottomRight,
                      //margin: EdgeInsets.only(left: 220, right: 20),
                      //width: 100,
                      child: GestureDetector(
                        onTap: () {
                          userEntryToDatabase();

                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => Chat_screen(docid: docid)));
                        },
                        child: Container(
                          //color: Color.fromRGBO(30, 159, 217, 1),
                          width: 140,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(30, 159, 217, 1),
                            borderRadius: BorderRadius.circular(5.0),
                            //border: Border.all(color: Colors.black),
                          ),
                          //margin: const EdgeInsets.symmetric(horizontal: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(right: 10, left: 5, top: 3),
                                child: const Icon(
                                  Icons.chat,
                                  color: Colors.white,
                                  //color: Color.fromRGBO(30, 159, 217, 1),
                                  size: 20,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 05, 10, 5),
                                child: Text(
                                  "Chat",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
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
          height: 300,
          viewportFraction: 1,
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

class title_desc extends StatefulWidget {
  const title_desc({Key? key}) : super(key: key);

  @override
  State<title_desc> createState() => _title_descState();
}

class _title_descState extends State<title_desc> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget buildImage(String urlImage, int index) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    color: Colors.grey,
    child: Image.network(
      urlImage,
      fit: BoxFit.cover,
    ),
  );
}
