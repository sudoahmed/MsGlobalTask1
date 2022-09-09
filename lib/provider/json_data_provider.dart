import 'package:flutter/material.dart';
import 'package:ms_global_task1/services/postFetchService.dart';

class JsonDataProvider with ChangeNotifier {
  var _decode;

  dynamic get decode => _decode;

  void setDecode(decoded) {
    _decode = decoded;
    notifyListeners();
  }
}
