import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class AuthService {
  void authenticate(String userEmail, String userPass) async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      print(response.statusCode);
      //print(response.body);
      var responseBody = response.body;
      var decoded = convert.jsonDecode(response.body);
      //print(decoded);
      //TODO: Work on the Login Logic
      for (var i = 1; i < 10; i++) {
        if (decoded[i]['email'] == userEmail && decoded[i]['username']) {
          print('Login Success');
        }
        // print(decoded[i]['email']);
        // print(decoded[i]['username']);
      }
    } else {
      print('error');
    }
  }
}
