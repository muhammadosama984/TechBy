import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:techby/database/ads.dart';
import 'package:techby/database/savedAds.dart';

class adsList extends ChangeNotifier {
  List<ads> ListOfAds = [];
  List<ads> ListOfMyAds = [];
  List<ads> ListOfMyFav = [];

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
        //print(doc.id);
        ListOfAds.add(temp);

      });
    });
  }

  Future<void> get_savedAds_ads(List<savedAds> listOfSaved) async {
    ListOfMyFav.clear();
    await adsList();

    for (int i = 0; i < listOfSaved.length; i++) {
      int x = -1;
      x = ListOfAds.indexWhere((element) =>
          element.docID.toString() == listOfSaved[i].doc_ID.toString());
      // print("");
      // print(x);
      // print("");
      if (x != -1) {
        ListOfAds[x].favAd = true;
        ListOfMyFav.add(ListOfAds[x]);
      }
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

  Future<List<ads>> categoryAds(
      List<ads> Ads, String category, List<savedAds> listOfSaved) async {
    await get_savedAds_ads(listOfSaved);

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

  List<ads> priceSort(List<ads> Ads, int min, int max) {
    List<ads> priceList = [];
    for (int i = 0; i < Ads.length; i++) {
      if (int.parse(Ads[i].price) >= min && int.parse(Ads[i].price) <= max) {
        priceList.add(Ads[i]);
      }
    }
    return priceList;
  }

  Future<void> postAds(
      {required String title_f,
      required String description_f,
      required String location_f,
      required DateTime uploadDate_f,
      required String price_f,
      required String category_f,
      required List<String> downloadURLS_f,
      required String emailAddressUser_f,
      required bool verified}) async {
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
        verifiedAd: verified);
    adReference
        .add(ad_Obj.toJson())
        .then((value) => print("Ad Posted"))
        .catchError((error) => print("Failed to post ad: $error"));
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
