import 'dart:io';

class Product {
  String doc;
  File Image;
  String imgURL;
  String title;
  String description;
  //int Price;
  String location;
  DateTime uploadDate;

  Product(
      {required this.Image,
      required this.imgURL,
      required this.title,
      required this.description,
      required this.location,
      required this.uploadDate,
      this.doc = ""});
}
