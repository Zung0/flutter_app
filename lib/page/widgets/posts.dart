import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:projet_fil_rouge/page/widgets/card_post.dart';

import '../data/post_data_class.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Post>>(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return CardPost(snapshot.data!);
          } else {
            return Text("No data");
          }
        },
      ),
    );
  }
}

Future<List<Post>> getPosts() async {
  final response = await get(
    Uri.parse(
      "https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json",
    ),
  );
  final List<dynamic> listPost = jsonDecode(response.body);
  return listPost
      .map(
        (item) =>
            Post.fromMap(item as Map<String, dynamic>),
      )
      .toList();
}
