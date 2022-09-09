import 'package:flutter/material.dart';

class UserDataProvider with ChangeNotifier {
  var _userID = 0;

  int get userID => _userID;

  void setID(userId) {
    _userID = userId;
    notifyListeners();
  }
}
