import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ms_global_task1/models/user_data_model.dart';
import 'package:ms_global_task1/provider/json_data_provider.dart';
import 'package:provider/provider.dart';

import '../provider/user_data_provider.dart';
import '../screens/all_posts.dart';

class PostFetchService {
  // UserDataModel userData =  UserDataModel();
  Future<void> fetchPosts(BuildContext context) async {
    final jsonData = Provider.of<JsonDataProvider>(context, listen: false);

    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      jsonData.setDecode(convert.jsonDecode(response.body));
      // print(response.body);
    } else {
      print(response.statusCode);
    }
  }

  List<Widget> getPosts(var decoded, BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context, listen: false);
    final jsonData = Provider.of<JsonDataProvider>(context, listen: false);
    return List.generate(100, (index) {
      return Container(
        height: 200,
        margin: EdgeInsets.all(10),
        child: Posts(
          postTitle: decoded[index]['title'],
          postBody: decoded[index]['body'],
          userId: jsonData.decode[index]['id'],
        ),
      );
    });
  }
}

// ListView.builder(
// itemCount: 100,
// itemBuilder: (context, index) {
// return Container(
// height: 200,
// margin: EdgeInsets.all(10),
// child: Posts(
// postTitle: decoded[index]['title'],
// postBody: decoded[index]['body'],
// userId: userData.userID,
// ),
// );
// });
