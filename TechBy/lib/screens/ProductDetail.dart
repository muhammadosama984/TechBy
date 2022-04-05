import 'package:flutter/material.dart';
import 'package:techby/screens/Chat_Page.dart';

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image(
                        image: NetworkImage(
                            'https://techcrunch.com/wp-content/uploads/2019/11/MacBook-Pro-16-IMG_2820-1.jpeg')),
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      readOnly: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      initialValue:
                          "This is the description of the Product\nbfff\ndfeyfgf\nbvtgh\nbrgrg\ndrgrggrg ",
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
