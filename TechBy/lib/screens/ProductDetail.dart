import 'package:flutter/material.dart';
import 'package:techby/screens/Chat%20system/Chat_Page.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
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
                    child: Image(image: NetworkImage('assets/macbook.jpeg')),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text(
                          "Product Title",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text("PKR Price",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        SizedBox(
                          height: 6,
                        ),
                        Text("karachi"),
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
                            Icons.calendar_today,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text("2022"),
                        ],
                      ),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      Column(
                        children: [
                          Icon(
                            Icons.battery_charging_full,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text("100%"),
                        ],
                      ),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      Column(
                        children: [
                          Icon(
                            Icons.check_circle_outline_rounded,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text("2 years"),
                        ],
                      )
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
                      initialValue:
                          "Lorem Ipsum is simply dummy text of the printing and \ntypesetting industry. Lorem Ipsum has been the industry's standard dummy text ever \nsince the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but dont know ",
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Chat_screen()));
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
