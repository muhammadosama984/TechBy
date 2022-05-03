import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:techby/Models/ListOfProducts.dart';
import 'package:techby/Models/product.dart';

class PostAds extends StatefulWidget {
  const PostAds({Key? key}) : super(key: key);

  @override
  State<PostAds> createState() => _PostAdsState();
}

class _PostAdsState extends State<PostAds> {
  List<String> items = ['Mobile', 'Laptop', 'Speakers', 'Keyboard'];
  String? valueOfCategory;
  late File _image;
  TextEditingController locationMain = TextEditingController();
  TextEditingController categoryMain = TextEditingController();
  TextEditingController titleMain = TextEditingController();
  TextEditingController descriptionMain = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _picker = ImagePicker();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Ads"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 100),
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
              DropdownButton(
                // Initial Value
                value: valueOfCategory,

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
                    valueOfCategory = value.toString();
                  });
                },
              ),
              _titleField(
                titleController: titleMain,
              ),
              SizedBox(height: 20),
              _description(
                descriptionController: descriptionMain,
              ),
              RaisedButton(
                onPressed: () {
                  _openImagePicker();
                },
                child:
                    const Text('Pick Images', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              _postButton(
                val: valueOfCategory,
                titleController: titleMain,
                descriptionController: descriptionMain,
                locationController: locationMain,
                CategoryController: categoryMain,
                img: _image,
              ),
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
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
            hintText: "Description",
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(12, 2, 12, 10),
            border: InputBorder.none),
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
        decoration: InputDecoration(hintText: "Title"),
      ),
    );
  }
}

class _postButton extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController CategoryController = TextEditingController();
  String? val;
  File img;
  _postButton(
      {Key? key,
      required this.titleController,
      required this.descriptionController,
      required this.locationController,
      required this.CategoryController,
      required this.val,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
        if (val != null) {
          CategoryController.text = val.toString();
        }
        String URL = img as String;
        Provider.of<ListofProduct>(context, listen: false).addProduct(Product(
            Image: img,
            imgURL: URL,
            title: titleController.text,
            description: descriptionController.text,
            location: locationController.text,
            uploadDate: DateTime.now()));
      },
      child: Text("  Post  ", style: TextStyle(fontSize: 20)),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Colors.black)),
    );
  }
}
