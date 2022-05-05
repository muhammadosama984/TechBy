import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:techby/database/ads.dart';

class adsList extends ChangeNotifier{
  List<ads> ListOfAds=[];

  Future <void> getAds() async{
    ListOfAds.clear();
    await FirebaseFirestore.instance
        .collection('PostedAds')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        ads temp=ads.fromJson(doc.data() as Map<String, dynamic>);
        temp.docID=doc.id;
        print(doc.id);
        // if(temp.done==true)
        //   temp.completion_dateTime=DateTime.parse(doc.get("Completion Date"));
        ListOfAds.add(temp);
        //  print(tasks[0].title);
      });
    });

  }


}