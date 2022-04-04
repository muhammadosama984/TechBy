import 'package:flutter/material.dart';

class PostAds extends StatefulWidget {
  const PostAds({Key? key}) : super(key: key);

  @override
  State<PostAds> createState() => _PostAdsState();
}

class _PostAdsState extends State<PostAds> {
  List<String> items = ['Mobile', 'Laptop', 'Speakers', 'Keyboard'];
  String? value1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Ads"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25, left: 25, right: 25),
              height: 100,
              decoration: BoxDecoration(color: Colors.lightBlue[200]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 60),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Location"),
                )),
            SizedBox(
              height: 20,
            ),
            DropdownButton(
              // Initial Value
              value: value1,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (value) {
                setState(() {
                  value1 = value.toString();
                });
              },
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 60),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Title"),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 60),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: "Description",
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(12, 2, 12, 10),
                    border: InputBorder.none),
              ),
            ),
            RaisedButton(
              color: Colors.lightBlue[200],
              onPressed: () {},
              child: Text("Post"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
