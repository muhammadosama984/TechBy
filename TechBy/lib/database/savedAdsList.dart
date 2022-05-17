import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:techby/database/ads.dart';
import 'package:techby/database/savedAds.dart';

class savedAdsList extends ChangeNotifier {
  List<savedAds> ListOfsavedAds = [];

  Future<void> getMyAds({required String emailAddress}) async {
    ListOfsavedAds.clear();
    await FirebaseFirestore.instance
        .collection('savedAds')
        .where('email', isEqualTo: emailAddress)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        savedAds temp = savedAds.fromJson(doc.data() as Map<String, dynamic>);
        // temp.favAd=false;
        temp.DB_docID = doc.id;
        //print(doc.id);
        ListOfsavedAds.add(temp);
      });
    });
  }

  Future<void> addSavedAd(
      {required String email, required String doc_ID}) async {
    QuerySnapshot adExist = await FirebaseFirestore.instance
        .collection('savedAds')
        .where('doc_ID', isEqualTo: doc_ID)
        .where('email', isEqualTo: email)
        .get();
    if (adExist.docs.isNotEmpty) {
      print("Ad already exists");
    } else {
      CollectionReference adReference =
          FirebaseFirestore.instance.collection('savedAds');
      final savedAdObj = savedAds(email: email, doc_ID: doc_ID);
      adReference
          .add(savedAdObj.toJson())
          .then((value) => print("Ad Posted"))
          .catchError((error) => print("Failed to add ad: $error"));
    }
    await getMyAds(emailAddress: email);
  }

  Future<void> deleteSavedAd({required String dataBase_doc_ID}) async {
    String id = "";

    int x = ListOfsavedAds.indexWhere(
        (element) => element.doc_ID.toString() == dataBase_doc_ID.toString());
    // print("");
    // print(x);
    // print("");
    if (x != -1) {
      id = ListOfsavedAds[x].DB_docID;
    }

    await FirebaseFirestore.instance
        .collection('savedAds')
        .doc(id)
        .delete()
        .catchError((e) {
      print(e);
    }).whenComplete(() => print('deleted'));
  }

  void printList() {
    for (int i = 0; i < ListOfsavedAds.length; i++) {
      print(ListOfsavedAds[i].email);
      print('');
    }
  }
}
