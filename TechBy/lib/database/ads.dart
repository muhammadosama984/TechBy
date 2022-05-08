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
  List<dynamic> downloadURLS;
  String emailAddressUser;

  ads({
    required this.title,
    required this.description,
    required this.location,
    required this.uploadDate,
    required this.price,
    required this.category,
    required this.downloadURLS,
    required this.emailAddressUser,
    this.docID = "",
  });

  static ads fromJson(Map<String, dynamic> json) => ads(
      title: json['title'],
      description: json['description'],
      location: json['location'],
      uploadDate: DateTime.parse(json['uploadDate']),
      price: json['price'],
      category: json['category'],
      downloadURLS: json['imageUrls'],
      emailAddressUser: json['emails']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['description'] = description;
    data['location'] = location;
    data['uploadDate'] = uploadDate.toIso8601String();
    data['price'] = price;
    data['category'] = category;
    data['imageUrls'] = downloadURLS;
    data['emails'] = emailAddressUser;
    return data;
  }
}
