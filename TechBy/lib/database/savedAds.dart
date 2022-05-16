import 'package:techby/database/ads.dart';

class savedAds {
  String email;
  String doc_ID;
  String DB_docID;

  savedAds({required this.email, required this.doc_ID,this.DB_docID=""});

  static savedAds fromJson(Map<String, dynamic> json) =>
      savedAds(doc_ID: json['doc_ID'], email: json['email']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['doc_ID'] = doc_ID;
    data['email'] = email;

    return data;

  }
}
