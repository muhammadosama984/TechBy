import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techby/Models/ListOfProducts.dart';
import 'package:techby/Models/product.dart';
import 'package:techby/database/adsList.dart';
import 'package:techby/screens/NavBar/Home/mainPage.dart';

import '../../../Sign _In/google_sign_in.dart';

class PostAds extends StatefulWidget {
  const PostAds({Key? key}) : super(key: key);

  @override
  State<PostAds> createState() => _PostAdsState();
}

class _PostAdsState extends State<PostAds> {
  List<String> items1 = ['Category'];
  List<String> items = [
    'Desktop',
    'Mobile',
    'Laptop',
    'Speaker',
    'Monitor',
    'Camera',
  ];
  String? valueOfCategory;
  File? _image;
  TextEditingController locationMain = TextEditingController();
  TextEditingController categoryMain = TextEditingController();
  TextEditingController titleMain = TextEditingController();
  TextEditingController descriptionMain = TextEditingController();
  TextEditingController priceMain = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  List<XFile> multipleImages = [];
  void clearfield() {
    locationMain.clear();
    categoryMain.clear();
    titleMain.clear();
    descriptionMain.clear();
    priceMain.clear();
  }

  bool validate() {
    if (locationMain == null ||
        categoryMain == null ||
        titleMain == null ||
        descriptionMain == null) {
      return true;
    }
    return false;
  }

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        print(_image);
      });
    }
  }

  Future<List<XFile>> multiImagePicker() async {
    List<XFile>? _images = await ImagePicker().pickMultiImage();
    if (_images != null && _images.isNotEmpty) {
      return _images;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("  Post an Ad"),
        backgroundColor: Color.fromRGBO(30, 159, 217, 1),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                width: 250,
                height: 59,
                //color: Color.fromRGBO(30, 159, 217, 1),
                // decoration:
                //     BoxDecoration(
                //         border: Border.all(color: Colors.black)
                //
                //     ),
                child: DropdownButtonFormField(
                  focusColor: Colors.white70,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.white70,
                  ),

                  // Initial Value
                  value: valueOfCategory,
                  hint: Text(
                    "  Select Category",
                    style: TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                  // Down Arrow Icon

                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),

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
                      valueOfCategory = value.toString();
                      categoryMain.text = valueOfCategory!;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              _titleField(titleController: titleMain),
              SizedBox(
                height: 50,
              ),
              _description(descriptionController: descriptionMain),
              _priceField(priceController: priceMain),
              SizedBox(
                height: 50,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  child: TextFormField(
                    controller: locationMain,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(hintText: "Location"),
                  )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
              ),
              Wrap(
                children: multipleImages
                    .map((e) => Image.file(
                          File(e.path),
                          width: 100,
                          height: 100,
                        ))
                    .toList(),
              ),
              Container(
                width: 300,
                height: 50,
                child: RaisedButton(
                  onPressed: () async {
                    // _openImagePicker();
                    multipleImages = await multiImagePicker();
                    if (multipleImages.isNotEmpty) {
                      setState(() {});
                    }
                  },
                  child: const Text('Pick Images',
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  color: Colors.white,
                  textColor: Colors.white,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _postButton(
                //val: valueOfCategory,
                titleController: titleMain,
                descriptionController: descriptionMain,
                locationController: locationMain,
                CategoryController: categoryMain,
                priceController: priceMain,

                //img: _image,
                multiImages: multipleImages,
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _description extends StatelessWidget {
  TextEditingController descriptionController = TextEditingController();

  _description({Key? key, required this.descriptionController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 60),
      child: TextFormField(
        controller: descriptionController,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
            hintText: "Description",
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(1, 2, 12, 10),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
            )),
      ),
    );
  }
}

class _titleField extends StatelessWidget {
  TextEditingController titleController = TextEditingController();

  _titleField({Key? key, required this.titleController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60),
      child: TextFormField(
        controller: titleController,
        decoration: InputDecoration(hintText: "Title"),
      ),
    );
  }
}

class _priceField extends StatelessWidget {
  TextEditingController priceController = TextEditingController();

  _priceField({Key? key, required this.priceController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: priceController,
        decoration: InputDecoration(hintText: "Price"),
      ),
    );
  }
}

class _postButton extends StatefulWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController CategoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  //String? val;
  //File? img;
  List<XFile> multiImages;

  _postButton(
      {Key? key,
      required this.titleController,
      required this.descriptionController,
      required this.locationController,
      required this.CategoryController,
      required this.priceController,
      //required this.val,
      //required this.img,
      required this.multiImages})
      : super(key: key);

  @override
  State<_postButton> createState() => _postButtonState();
}

class _postButtonState extends State<_postButton> {
  bool isPosted = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      child: RaisedButton(
        color: Color.fromRGBO(30, 159, 217, 1),
        onPressed: () async {
          // if (val != null) {
          //   CategoryController.text = val.toString();
          // }
          //String URL = img as String;
          // Provider.of<ListofProduct>(context, listen: false).addProduct(Product(
          //     Image: img,
          //     imgURL: URL,
          //     title: titleController.text,
          //     description: descriptionController.text,
          //     location: locationController.text,
          //     uploadDate: DateTime.now()));
          //print(CategoryController.text);
          setState(() {
            isPosted = true;
          });

          List<String> urls = await Provider.of<adsList>(context, listen: false)
              .multiImageUploader(widget.multiImages) as List<String>;
          print(widget.titleController.text +
              widget.descriptionController.text +
              widget.CategoryController.text +
              widget.priceController.text +
              widget.locationController.text +
              " " +
              urls[0]);
          Provider.of<adsList>(context, listen: false).postAds(
              title_f: widget.titleController.text,
              description_f: widget.descriptionController.text,
              location_f: widget.locationController.text,
              uploadDate_f: DateTime.now(),
              price_f: widget.priceController.text,
              category_f: widget.CategoryController.text.toString(),
              downloadURLS_f: urls,
              emailAddressUser_f: (await Provider.of<GoogleSingInProvider>(
                      context,
                      listen: false)
                  .emailAddress()));

          setState(() {
            isPosted = false;
          });

          bool isLogout = false;
          isLogout = await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Task Added'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                          },
                          child: Text('OK')),
                    ],
                  ));
        },
        child: !isPosted
            ? Text("Post Now",
                style: TextStyle(fontSize: 15, color: Colors.white))
            : const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1.5,
                )),
        //textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          //side: BorderSide(color: Colors.black)
        ),
      ),
    );
  }
}
