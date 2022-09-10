import 'package:flutter/material.dart';

class UserDataProvider with ChangeNotifier {
  var _userID = 0;
  int get userID => _userID;
  void setID(userId) {
    _userID = userId;
    notifyListeners();
  }

  var _name = '';
  String get name => _name;
  void setName(Name) {
    _name = Name.toString();
    notifyListeners();
  }

  var _user = '';
  String get user => _user;
  void setUser(User) {
    _user = User.toString();
    notifyListeners();
  }

  var _address = '';
  String get address => _address;
  void setAddress(Address) {
    _address = Address.toString();
    notifyListeners();
  }

  var _zip = '';
  String get zip => _zip;
  void setZip(Zip) {
    _zip = Zip.toString();
    notifyListeners();
  }
}
