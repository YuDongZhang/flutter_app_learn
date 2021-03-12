import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    fetchPosts().then((value) => print(value));

    /* final post = {
      'title': 'hello',
      'description': 'nice to meet you.',
    };
    print(post['title']);
    print(post['description']);

    final postJson = json.encode(post);
    print(postJson);

    final postJsonConverted = json.decode(postJson);
    print(postJsonConverted['title']);
    print(postJsonConverted['description']);
    print(postJsonConverted is Map); //判断是否是 map

    final postModel = Post.fromJson(postJsonConverted);
    print('title: ${postModel.title}, description: ${postModel.description}');

    //转json字符串
    print('${json.encode(postModel)}');*/
  }

  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    // print('statusCode : ${response.statusCode}');
    // print('statusCode : ${response.body}');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts']
          //map处理返回的项目是post , 括号里面当前的是item
          //会把map数据转成post数据 , 再tolist
          .map<Post>((item) => Post.fromJson(item))
          .toList();

      return posts;
    } else {
      throw Exception('Failed to fetch posts.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot 会带着future里面的数据
        print('data: ${snapshot.data}');
        print('connectionState: ${snapshot.connectionState}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        }

        return ListView(
          children: snapshot.data.map<Widget>((item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(
    this.id,
    this.title,
    this.description,
    this.author,
    this.imageUrl,
  );

  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
        'title': title,
        'descritpion': description,
      };
}
