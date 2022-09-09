import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ms_global_task1/components/custom_drawer.dart';
import 'package:ms_global_task1/constants/color_constants.dart';
import 'package:ms_global_task1/models/user_data_model.dart';
import 'package:ms_global_task1/provider/json_data_provider.dart';
import 'package:ms_global_task1/provider/user_data_provider.dart';
import 'package:ms_global_task1/services/authService.dart';
import 'package:ms_global_task1/services/postFetchService.dart';
import 'package:provider/provider.dart';

class AllPostsScreens extends StatefulWidget {
  const AllPostsScreens({Key? key}) : super(key: key);

  @override
  State<AllPostsScreens> createState() => _AllPostsScreensState();
}

class _AllPostsScreensState extends State<AllPostsScreens>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context);
    final jsonData = Provider.of<JsonDataProvider>(context);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        elevation: 10.0,
        title: Text('Lorem Ipsum'),
        actions: [
          InkWell(
            child: Icon(Icons.search),
            onTap: () {
              print(userData.userID);
              print(jsonData.decode[45]['id']);
            },
          ),
        ],
        bottom: TabBar(controller: _controller, tabs: const <Widget>[
          Tab(
            text: 'All Posts',
          ),
          Tab(
            text: 'Profile',
          ),
        ]),
      ),
      body: TabBarView(controller: _controller, children: [
        ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Posts(
                postTitle: jsonData.decode[index]['title'],
                postBody: jsonData.decode[index]['body'],
                userId: jsonData.decode[index]['userId'],
              ),
            );
          },
        ),
        Center(
          child: Text('Profile'),
        ),
      ]),
    );
  }
}

class Posts extends StatefulWidget {
  const Posts({
    Key? key,
    required this.postTitle,
    required this.postBody,
    required this.userId,
  }) : super(key: key);

  final String postTitle;
  final String postBody;
  final int userId;

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.postTitle,
            style: TextStyle(
                fontSize: 18,
                fontWeight: widget.userId == userData.userID
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: widget.userId == userData.userID
                    ? kPrimaryColor
                    : Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.postBody,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const Divider(
            color: Colors.black12,
            height: 30,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

// postTitle: jsonData.decode[i]['title'],
// postBody: jsonData.decode[i]['body'],
// userId: userData.userID,
