
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostAds extends StatefulWidget {
  const PostAds({Key? key}) : super(key: key);

  @override
  State<PostAds> createState() => _PostAdsState();
}

class _PostAdsState extends State<PostAds> {
  List<String> items = ['Mobile', 'Laptop', 'Speakers', 'Keyboard'];
  String? value1;
  File? _image;

  final _picker = ImagePicker();

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Ads"),
        automaticallyImplyLeading: false,
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
              height: 100,
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
              onPressed: () {
                _openImagePicker();
              },
              child: const Text('Pick Images', style: TextStyle(fontSize: 20)),
              color: Colors.lightBlue[200],
              textColor: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.lightBlue[200],
              onPressed: () {},
              child: Text("  Post  ", style: TextStyle(fontSize: 20)),
              textColor: Colors.white,
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
