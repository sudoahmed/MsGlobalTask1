import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ms_global_task1/provider/user_data_provider.dart';
import 'package:provider/provider.dart';

import '../models/user_data_model.dart';

class AuthService {
  Future<bool> authenticate(
      String userEmail, String userPass, BuildContext context) async {
    final userData = Provider.of<UserDataProvider>(context, listen: false);
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      print(response.statusCode);
      //print(response.body);
      var responseBody = response.body;
      var decoded = convert.jsonDecode(response.body);
      //print(decoded);
      //TODO: Work on the Login Logic
      for (var i = 0; i < 10; i++) {
        if (userEmail == decoded[i]['email'] &&
            userPass == decoded[i]['username']) {
          //print('Login Success');
          // UserDataModel().setName = decoded[i]['userId'];
          print(decoded[i]['email']);
          print(decoded[i]['username']);

          print(decoded[i]['id']);
          userData.setID(decoded[i]['id']);
          return true;
        }
        // print(decoded[i]['email']);
        // print(decoded[i]['username']);
      }
      //print('Login Failed');
      return false;
    } else {
      //print('error');
      return false;
    }
  }
}
