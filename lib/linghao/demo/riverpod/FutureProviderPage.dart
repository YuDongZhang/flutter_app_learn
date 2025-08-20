import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 复用之前定义的 VideoItem 模型
import 'package:flutter_app_learn/linghao/demo/dio/DioProvider.dart';

// --- 数据层: Repository ---
// 最佳实践: 将数据获取逻辑（网络请求、数据库访问等）从 UI 和业务逻辑中分离出来。
// 这个 Repository 只关心一件事：如何获取视频数据。
class VideoRepository {
  final _dio = Dio();

  Future<List<VideoItem>> fetchVideos() async {
    // 模拟一个网络延迟，以便更清楚地看到加载状态
    await Future.delayed(const Duration(seconds: 1));

    try {
      final response = await _dio.get('https://api.apiopen.top/api/getHaoKanVideo?page=0&size=20');
      if (response.statusCode == 200) {
        final data = response.data;
        // 健壮性检查：确保返回的数据结构是我们期望的
        if (data is Map<String, dynamic> && data['result'] is Map<String, dynamic> && data['result']['list'] is List) {
          final List list = data['result']['list'];
          return list.map<VideoItem>((item) => VideoItem.fromJson(item)).toList();
        } else {
          throw Exception('无效的 API 响应数据格式');
        }
      } else {
        throw Exception('加载视频失败，状态码: ${response.statusCode}');
      }
    } catch (e) {
      // 将捕获到的 DioError 或其他异常统一向上抛出
      // FutureProvider 会自动捕获这个异常并将其转换为 error 状态
      throw Exception('请求失败: $e');
    }
  }
}

// --- 业务逻辑层: Providers ---

// 1. 创建一个 Provider 来提供 Repository 实例
//    这使得我们可以轻松地在其他 Provider 中访问它，或者在测试中替换它。
final videoRepositoryProvider = Provider<VideoRepository>((ref) {
  return VideoRepository();
});

// 2. 创建 FutureProvider
//    - `FutureProvider` 专门用于执行一次性的异步操作（如网络请求）并缓存其结果。
//    - 它会自动处理加载（loading）和错误（error）状态，你无需手动管理。
//    - 它会监听 `videoRepositoryProvider`，当依赖变化时可以自动更新。
final videoListProvider = FutureProvider<List<VideoItem>>((ref) async {
  // 通过 ref.watch 获取 Repository 实例
  final repository = ref.watch(videoRepositoryProvider);
  // 调用方法获取数据，FutureProvider 会自动处理这个 Future
  return repository.fetchVideos();
});

// --- UI 展示层: Widget ---

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. 监听 FutureProvider 的状态
    //    - `ref.watch` 会返回一个 `AsyncValue<List<VideoItem>>` 对象。
    //    - 当 Future 的状态改变时（加载中 -> 成功/失败），这个 Widget 会自动重建。
    final asyncVideos = ref.watch(videoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider 示例'),
        actions: [
          // 添加一个刷新按钮来演示如何让 Provider 重新执行
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // `ref.invalidate` 会让 Provider 失效并强制重新获取数据。
              ref.invalidate(videoListProvider);
            },
          ),
        ],
      ),
      // 4. 使用 `when` 方法来根据 AsyncValue 的不同状态构建不同的 UI
      //    这是处理异步数据的最佳方式，因为它能确保你处理了所有可能的情况。
      body: asyncVideos.when(
        // 数据成功加载时显示的 UI
        data: (videos) => ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, index) {
            final item = videos[index];
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(item.userPic)),
              title: Text(item.title),
              subtitle: Text(item.userName),
            );
          },
        ),
        // 发生错误时显示的 UI
        error: (err, stack) => Center(child: Text('加载出错: $err')),
        // 正在加载时显示的 UI
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
