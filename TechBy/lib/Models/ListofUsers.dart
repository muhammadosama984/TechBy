import 'package:flutter/cupertino.dart';
import 'package:techby/Models/Users.dart';
import 'package:provider/provider.dart';

class ListofUser with ChangeNotifier {
  List<User> userList = [];
  List<User> get returnUserList => userList;

  set userListSet(User user) {
    userList.add(user);
    notifyListeners();
  }
}
