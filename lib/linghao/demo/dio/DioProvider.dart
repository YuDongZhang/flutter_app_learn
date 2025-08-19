import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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

class DioProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  List<VideoItem> _videos = [];
  bool _loading = false;
  String? _error;

  List<VideoItem> get videos => _videos;

  bool get loading => _loading;

  String? get error => _error;

  Future<List<VideoItem>> fetchVideos() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      final response = await _dio.get('https://api.apiopen.top/api/getHaoKanVideo?page=0&size=20');
      if (response.statusCode == 200) {
        final data = response.data;
        // 检查 API 响应数据的有效性
        if (data is Map<String, dynamic> && data['result'] is Map<String, dynamic> && data['result']['list'] is List) {
          final List list = data['result']['list'];
          _videos = list.map<VideoItem>((item) => VideoItem.fromJson(item)).toList();
          _loading = false;
          notifyListeners();
          return _videos;
        } else {
          _error = '无效的 API 响应数据格式';
          _loading = false;
          notifyListeners();
          throw Exception(_error);
        }
      } else {
        _error = '加载视频失败，状态码: ${response.statusCode}';
        _loading = false;
        notifyListeners();
        throw Exception(_error);
      }
    } catch (e) {
      _error = e.toString();
      _loading = false;
      notifyListeners();
      throw Exception(_error);
    }
  }
}
