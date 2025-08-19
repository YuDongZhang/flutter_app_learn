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
    fetchVideos().then((value) => print(value));
  }

  Future<List<VideoItem>> fetchVideos() async {
    final response = await http.get(Uri.parse('https://api.apiopen.top/api/getHaoKanVideo?page=0&size=10'));
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      final List list = jsonMap['result']['list'];
      return list.map<VideoItem>((item) => VideoItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VideoItem>>(
      future: fetchVideos(),
      builder: (BuildContext context, AsyncSnapshot<List<VideoItem>> snapshot) {
        print('data: ${snapshot.data}');
        print('connectionState: ${snapshot.connectionState}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No data.'));
        }
        final videos = snapshot.data!;
        return ListView(
          children: videos.map<Widget>((item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.userName),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.userPic),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class VideoItem {
  final int id;
  final String title;
  final String userName;
  final String userPic;
  final String coverUrl;
  final String playUrl;
  final String duration;

  VideoItem({
    required this.id,
    required this.title,
    required this.userName,
    required this.userPic,
    required this.coverUrl,
    required this.playUrl,
    required this.duration,
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    return VideoItem(
      id: json['id'],
      title: json['title'],
      userName: json['userName'],
      userPic: json['userPic'],
      coverUrl: json['coverUrl'],
      playUrl: json['playUrl'],
      duration: json['duration'],
    );
  }
}
