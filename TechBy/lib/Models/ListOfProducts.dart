import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:techby/Models/product.dart';

class ListofProduct with ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection("");
  List<Product> productList = [];
  List<Product> get returnProductList => productList;

  set productListSet(Product product) {
    productList.add(product);
    notifyListeners();
  }

  addProduct(Product product) {}

  deleteProduct(Product product) {}
}
