import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image(
                    image: NetworkImage(
                        'https://techcrunch.com/wp-content/uploads/2019/11/MacBook-Pro-16-IMG_2820-1.jpeg')),
              ),
              Text(
                "Product Title",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 6,
              ),
              Text("PKR Price",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              SizedBox(
                height: 6,
              ),
              Text("karachi"),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                readOnly: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                initialValue:
                    "This is the description of the Product jabfwergbfrgbbewrbgrweguhegrvbrgruohrogherghrouighirhgrighbeihrighggg5q5h5h5\nerg5grg5trggr3q4t4ergergt54",
                decoration: InputDecoration(
                    fillColor: Colors.grey[300],
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(12, 2, 12, 10),
                    border: InputBorder.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
