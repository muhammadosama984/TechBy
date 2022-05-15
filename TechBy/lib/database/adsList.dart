import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:techby/database/ads.dart';
import 'package:techby/database/savedAds.dart';
import 'package:techby/database/savedAdsList.dart';

import '../Sign _In/google_sign_in.dart';

class adsList extends ChangeNotifier {
  List<ads> ListOfAds = [];
  List<ads> ListOfMyAds = [];

  Future<void> getAds() async {
    ListOfAds.clear();
    await FirebaseFirestore.instance
        .collection('PostedAds')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        ads temp = ads.fromJson(doc.data() as Map<String, dynamic>);
        // temp.favAd=false;
        temp.docID = doc.id;
        temp.favAd = false;
        print(doc.id);
        // if(temp.done==true)
        //   temp.completion_dateTime=DateTime.parse(doc.get("Completion Date"));
        ListOfAds.add(temp);
        //  print(tasks[0].title);
      });
    });
  }

  Future<void> get_savedAds_ads(List<savedAds> listOfSaved) async {
    await adsList();
    for (int i = 0; i < listOfSaved.length; i++) {
      int x = ListOfMyAds.indexWhere(
          (element) => element.docID == listOfSaved[i].doc_ID);
      ListOfAds[x].favAd = true;
    }
  }

  Future<List<ads>> myAds(String email) async {
    ListOfMyAds.clear();
    await adsList();
    for (int i = 0; i < ListOfAds.length; i++) {
      if (ListOfAds[i].emailAddressUser == email) {
        ListOfMyAds.add(ListOfAds[i]);
      }
    }
    return ListOfMyAds;
  }

  List<ads> categoryAds(List<ads> Ads, String category) {
    List<ads> categoryList = [];
    for (int i = 0; i < Ads.length; i++) {
      if (Ads[i].category == category) {
        categoryList.add(Ads[i]);
      }
    }
    return categoryList;
  }

  List<ads> locationSort(List<ads> Ads, String location) {
    List<ads> locationList = [];
    for (int i = 0; i < Ads.length; i++) {
      if (Ads[i].location == location) {
        locationList.add(Ads[i]);
      }
    }
    return locationList;
  }

  List<ads> priceSort(List<ads> Ads, {int min = 0, int max = 4294967296}) {
    List<ads> priceList = [];
    for (int i = 0; i < Ads.length; i++) {
      if (int.parse(Ads[i].price) >= min && int.parse(Ads[i].price) <= max) {
        priceList.add(Ads[i]);
      }
    }
    return priceList;
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
        emailAddressUser: emailAddressUser_f,
        favAd: false,
        verifiedAd: false);
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

  updateAd({required ads myAd}) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('PostedAds').doc(myAd.docID);
    final Map<String, dynamic> data = {};
    data['title'] = myAd.title;
    data['description'] = myAd.description;
    data['location'] = myAd.location;
    data['uploadDate'] = myAd.uploadDate.toIso8601String();
    data['price'] = myAd.price;
    data['category'] = myAd.category;
    data['imageUrls'] = myAd.downloadURLS;
    data['emails'] = myAd.emailAddressUser;
    data['favAd'] = myAd.favAd;
    data['verifiedAd'] = myAd.verifiedAd;

    // update data to Firebase
    documentReference.update(data).whenComplete(() => print('updated'));
  }

  Future<void> remove(ads tt) async {
    ListOfMyAds.remove(tt);
    await deleteProduct(tt);

    notifyListeners();
  }

  deleteProduct(ads product) async {
    await FirebaseFirestore.instance
        .collection('PostedAds')
        .doc(product.docID)
        .delete()
        .catchError((e) {
      print(e);
    }).whenComplete(() => print('deleted'));
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
