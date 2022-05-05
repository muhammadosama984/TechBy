import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:techby/Models/product.dart';

class ListofProduct with ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection("Products");
  final _storage = FirebaseStorage.instance;
  List<Product> productList = [];
  List<Product> get returnProductList => productList;

  set productListSet(Product product) {
    productList.add(product);
    notifyListeners();
  }

  Product fromJson(Map<String, dynamic> data) {
    return Product(
      //needed to be set
      Image: data['imgURL'] as File,
      title: data['title'],
      description: data['description'],
      location: data['location'],
      uploadDate: data['date'],
      imgURL: data['imgURl'],
    );
  }

  getTask() {
    FirebaseFirestore.instance
        .collection('Products')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        Product a = (fromJson(doc.data() as Map<String, dynamic>));
        String b = a.imgURL;
        String downloadURL = await FirebaseStorage.instance
            .ref()
            .child('ProductImages/$b')
            .getDownloadURL()
            .toString();
        a.doc = doc.id;
        a.Image = downloadURL as File;
        productList.add(a);
      });
    });
  }

  addProduct(Product product) async {
    String a = product.imgURL;

    //await _storage.ref('ProductImages/$a').putFile(product.Image);
    users
        .add({
          'title': product.title,
          'description': product.description,
          'location': product.location,
          'date': product.uploadDate,
          'imgURl': product.imgURL
        })
        .then((value) => print(""))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> remove(Product tt) async {
    productList.remove(tt);
    await deleteProduct(tt);

    notifyListeners();
  }

  deleteProduct(Product product) async {
    await FirebaseFirestore.instance
        .collection('Products')
        .doc(product.doc)
        .delete()
        .catchError((e) {
      print(e);
    }).whenComplete(() => print('deleted'));
  }
}
