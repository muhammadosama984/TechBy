
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:techby/Models/product.dart';


class ListofProduct with ChangeNotifier {
  List<Product> productList = [];
  List<Product> get returnProductList => productList;

  set productListSet(Product product) {
    productList.add(product);
    notifyListeners();
  }
}
