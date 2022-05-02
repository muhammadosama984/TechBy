import 'dart:io';

class Product {
  // List<String> Image;
  File? Image;
  String title;
  String description;
  //int Price;
  String location;
  DateTime uploadDate;

  Product(
      this.Image, this.title, this.description, this.location, this.uploadDate);
}
