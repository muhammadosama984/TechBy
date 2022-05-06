import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:techby/Models/Users.dart';
import 'package:provider/provider.dart';

class ListofUser with ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  List<User> userList = [];
  List<User> get returnUserList => userList;

  set userListSet(User user) {
    userList.add(user);
    notifyListeners();
  }

  getUsers() async {
    userList.clear();
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        User temp = User.fromJson(doc.data() as Map<String, dynamic>);
        temp.doc = doc.id;
        print(doc.id);
        // if(temp.done==true)
        //   temp.completion_dateTime=DateTime.parse(doc.get("Completion Date"));
        userList.add(temp);
        //  print(tasks[0].title);
      });
    });
  }

  addUsers(User user) {
    //String a = user.Image;

    //await _storage.ref('ProductImages/$a').putFile(product.Image);
    users
        .add({
          'firstname': user.firstname,
          'lastname': user.lastname,
          'email': user.email,
          'location': user.location,
          'ImageUrl': user.ImageUrl,
          'password': user.password,
        })
        .then((value) => print(""))
        .catchError((error) => print("Failed to add user: $error"));
  }

  updateUser(User user) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Users').doc(user.doc);

    final Map<String, dynamic> data = {};
    data['firstname'] = user.firstname;
    data['lastname'] = user.lastname;
    data['email'] = user.email;
    data['location'] = user.location;
    data['ImageUrl'] = user.ImageUrl;
    data['password'] = user.password;

    // update data to Firebase
    documentReference.update(data).whenComplete(() => print('updated'));
  }

  deleteUser(User user) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.doc)
        .delete()
        .catchError((e) {
      print(e);
    }).whenComplete(() => print('deleted'));
  }

  remove(User user) async {
    userList.remove(user);
    await deleteUser(user);

    notifyListeners();
  }
}
