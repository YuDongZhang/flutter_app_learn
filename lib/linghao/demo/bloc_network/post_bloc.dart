import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

// --- 1. Model ---
// 用于承载网络请求返回的数据
class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}


// --- 2. Event ---
// 定义 BLoC 需要处理的事件
abstract class PostEvent {}

class FetchPostEvent extends PostEvent {}


// --- 3. State ---
// 定义 BLoC 管理的状态
abstract class PostState {}

class PostInitial extends PostState {} // 初始状态

class PostLoading extends PostState {} // 加载中状态

class PostSuccess extends PostState { // 成功状态
  final Post post;
  PostSuccess(this.post);
}

class PostFailure extends PostState { // 失败状态
  final String error;
  PostFailure(this.error);
}


// --- 4. BLoC ---
// 业务逻辑组件
class PostBloc extends Bloc<PostEvent, PostState> {
  final Dio _dio = Dio();

  PostBloc() : super(PostInitial()) {
    // 注册事件处理器
    on<FetchPostEvent>(_onFetchPost);
  }

  Future<void> _onFetchPost(FetchPostEvent event, Emitter<PostState> emit) async {
    // 1. 发出加载中状态，UI会显示加载指示器
    emit(PostLoading());
    try {
      // 2. 发起网络请求
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts/1');
      // 3. 请求成功，解析数据并发出成功状态
      final post = Post.fromJson(response.data);
      emit(PostSuccess(post));
    } catch (e) {
      // 4. 请求失败，发出失败状态
      emit(PostFailure(e.toString()));
    }
  }
}