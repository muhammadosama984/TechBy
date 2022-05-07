import 'dart:io';

class ads {
  String docID;
  late List<File> Image;
  String title;
  String description;
  String price;
  String location;
  DateTime uploadDate;
  String category;
  late List<String> downloadURLS;
  String signIN_ID;

  ads(
      {required this.title,
      required this.description,
      required this.location,
      required this.uploadDate,
      required this.price,
      required this.category,
      this.docID = "",
      this.signIN_ID = ""});

  static ads fromJson(Map<String, dynamic> json) => ads(
      title: json['title'],
      description: json['description'],
      location: json['location'],
      uploadDate: DateTime.parse(json['uploadDate']),
      price: json['price'],
      category: json['category']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['description'] = description;
    data['location'] = location;
    data['uploadDate'] = uploadDate.toIso8601String();
    data['price'] = price;
    data['category'] = category;
    return data;
  }
}