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
        //temp.docID = doc.id;
        print(doc.id);
        // if(temp.done==true)
        //   temp.completion_dateTime=DateTime.parse(doc.get("Completion Date"));
        ListOfsavedAds.add(temp);
        //  print(tasks[0].title);
      });
    });
  }

  Future<void> addSavedAd({required String email, required String doc_ID}) async {
    //doc_ID.favAd=true;
    CollectionReference adReference =
        FirebaseFirestore.instance.collection('savedAds');
    final savedAdObj = savedAds(email: email, doc_ID: doc_ID);
    adReference
        .add(savedAdObj.toJson())
        .then((value) => print("Ad Posted"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void printList() {
    for (int i = 0; i < ListOfsavedAds.length; i++) {
      print(ListOfsavedAds[i].email);
      print('');
    }
  }
}
