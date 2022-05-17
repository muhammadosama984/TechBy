import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:techby/database/verifiedEmails.dart';

class verifiedEmailsList extends ChangeNotifier {
  List<verifiedEmails> ListOfVerifiedEmails = [];

  Future<void> getEmails() async {
    ListOfVerifiedEmails.clear();
    await FirebaseFirestore.instance
        .collection('verifiedEmails')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        verifiedEmails temp =
            verifiedEmails.fromJson(doc.data() as Map<String, dynamic>);
        print(temp.email);
        ListOfVerifiedEmails.add(temp);
      });
    });
  }

  bool checkverified({required userEmail}) {

    for (int i = 0; i < ListOfVerifiedEmails.length; i++) {
      if (ListOfVerifiedEmails[i].email.toString() == userEmail.toString()) {
        //print(ListOfVerifiedEmails[i].email.toString());
        return true;
      }
    }
    return false;
  }
}
