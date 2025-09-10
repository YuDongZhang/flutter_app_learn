import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_bloc.dart'; // 导入我们创建的 BLoC 文件

class BlocNetworkPage extends StatelessWidget {
  const BlocNetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 使用 BlocProvider 在组件树中提供 PostBloc 实例
    return BlocProvider(
      create: (context) => PostBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BLoC Network Request'),
        ),
        body: const PostView(),
      ),
    );
  }
}

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BlocBuilder 会监听 PostBloc 的状态变化并重建 UI
          BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              // 根据不同的状态返回不同的 Widget
              if (state is PostInitial) {
                return const Text('点击按钮获取数据');
              }
              if (state is PostLoading) {
                return const CircularProgressIndicator();
              }
              if (state is PostSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(state.post.title, style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text(state.post.body),
                    ],
                  ),
                );
              }
              if (state is PostFailure) {
                return Text('请求失败: ${state.error}', style: const TextStyle(color: Colors.red));
              }
              return Container(); // 默认情况
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // 点击按钮时，向 PostBloc 添加一个 FetchPostEvent 事件来触发网络请求
              context.read<PostBloc>().add(FetchPostEvent());
            },
            child: const Text('获取文章'),
          ),
        ],
      ),
    );
  }
}