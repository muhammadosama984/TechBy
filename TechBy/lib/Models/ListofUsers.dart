import 'package:flutter/cupertino.dart';
import 'package:techby/Models/Users.dart';

class ListofUser with ChangeNotifier {
  List<User> productList = [];
  List<User> get returnProductList => productList;

  set productListSet(User product) {
    productList.add(product);
    notifyListeners();
  }
}