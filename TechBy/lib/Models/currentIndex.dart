

import 'package:flutter/cupertino.dart';

class indexChange extends ChangeNotifier{
  int currentIndex=0;
  void setIndex(int i){
    currentIndex=i;
    notifyListeners();
  }

}