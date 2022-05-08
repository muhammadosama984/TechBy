import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:techby/database/ads.dart';

class adsList extends ChangeNotifier {
  List<ads> ListOfAds = [];

  Future<void> getAds() async {
    ListOfAds.clear();
    await FirebaseFirestore.instance
        .collection('PostedAds')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        ads temp = ads.fromJson(doc.data() as Map<String, dynamic>);
        temp.docID = doc.id;
        print(doc.id);
        // if(temp.done==true)
        //   temp.completion_dateTime=DateTime.parse(doc.get("Completion Date"));
        ListOfAds.add(temp);
        //  print(tasks[0].title);
      });
    });
  }

  Future<void> postAds({
    required String title_f,
    required String description_f,
    required String location_f,
    required DateTime uploadDate_f,
    required String price_f,
    required String category_f,
    required List<String> downloadURLS_f,
    required String emailAddressUser_f,
  }) async {
    CollectionReference adReference =
        FirebaseFirestore.instance.collection('PostedAds');
    final ad_Obj = ads(
        title: title_f,
        description: description_f,
        location: location_f,
        uploadDate: uploadDate_f,
        price: price_f,
        category: category_f,
        downloadURLS: downloadURLS_f,
        emailAddressUser: emailAddressUser_f);
    adReference
        .add(ad_Obj.toJson())
        .then((value) => print("Ad Posted"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<List<String>> multiImageUploader(List<XFile> list) async {
    List<String> _path = [];
    for (XFile _image in list) {
      _path.add(await uploadImage(_image));
    }
    return _path;
  }

  Future<String> uploadImage(XFile image) async {
    Reference db = FirebaseStorage.instance.ref(getImageName(image));
    await db.putFile(File(image.path));
    return await db.getDownloadURL();
  }

  String getImageName(XFile image) {
    return image.path.split("/").last;
  }
}
