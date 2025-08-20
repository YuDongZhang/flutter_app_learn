import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
/*
我们将把代码严格划分为三个层次：
1. 领域层 (Domain Layer): 应用的核心。包含业务实体 (VideoItem)、业务规则的接口 (VideoRepository) 和用例 (GetVideosUseCase)。它不依赖任何其他层。
2. 数据层 (Data Layer): 负责数据的获取。它会实现领域层定义的接口，并处理来自网络或数据库的具体数据操作。它依赖领域层。
3. 表现层 (Presentation Layer): 用户界面 (UI) 和状态管理。它负责展示数据和响应用户交互，并通过调用领域层的用例来执行业务逻辑。它依赖领域层。
通过这种方式，我们的核心业务逻辑（领域层）与具体实现（如网络请求库 Dio 或 UI 框架 Flutter）完全解耦，使得应用更易于测试、维护和扩展。
 */

//==============================================================================
// 1. 领域层 (DOMAIN LAYER)
// - 这是应用的核心，包含业务实体、仓库接口和用例。
// - 它完全独立，不依赖任何外部框架或具体实现（如 Dio, Flutter）。
//==============================================================================

/// 实体 (Entity) - 通常在 `domain/entities/video_item.dart`
/// 代表核心业务对象，是一个纯粹的 Dart 类。
@immutable
class VideoItem {
  final int id;
  final String title;
  final String userName;
  final String userPic;

  const VideoItem({
    required this.id,
    required this.title,
    required this.userName,
    required this.userPic,
  });
}

/// 仓库接口 (Repository Interface) - 通常在 `domain/repositories/video_repository.dart`
/// 定义了数据操作的契约（合同），但不关心如何实现。
abstract class VideoRepository {
  Future<List<VideoItem>> getVideos();
}

/// 用例 (Use Case) - 通常在 `domain/usecases/get_videos_usecase.dart`
/// 封装了一个具体的业务操作。它依赖于仓库的抽象接口，而不是具体实现。
class GetVideosUseCase {
  final VideoRepository _repository;

  GetVideosUseCase(this._repository);

  Future<List<VideoItem>> call() {
    return _repository.getVideos();
  }
}

//==============================================================================
// 2. 数据层 (DATA LAYER)
// - 负责实现领域层定义的接口。
// - 处理来自网络、数据库等具体的数据源。
// - 它依赖于领域层。
//==============================================================================

/// 数据传输对象 (DTO) / 模型 (Model) - 通常在 `data/models/video_model.dart`
/// 这个模型负责从 JSON 转换。它可以继承自实体，并添加 `fromJson` 等方法。
class VideoModel extends VideoItem {
  const VideoModel({
    required super.id,
    required super.title,
    required super.userName,
    required super.userPic,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      title: json['title'],
      userName: json['userName'],
      userPic: json['userPic'],
    );
  }
}

/// 仓库实现 (Repository Implementation) - 通常在 `data/repositories/video_repository_impl.dart`
/// 这是仓库接口的具体实现，它使用 Dio 来从 API 获取数据。
class VideoRepositoryImpl implements VideoRepository {
  final Dio _dio;

  VideoRepositoryImpl(this._dio);

  @override
  Future<List<VideoItem>> getVideos() async {
    try {
      final response = await _dio.get('https://api.apiopen.top/api/getHaoKanVideo?page=0&size=20');
      if (response.statusCode == 200) {
        final List list = response.data['result']['list'];
        return list.map((item) => VideoModel.fromJson(item)).toList();
      } else {
        throw Exception('加载视频失败');
      }
    } catch (e) {
      throw Exception('请求失败: $e');
    }
  }
}

//==============================================================================
// 3. 表现层 (PRESENTATION LAYER)
// - 包含 UI (Widgets) 和状态管理 (Providers)。
// - 它依赖于领域层来执行业务逻辑。
//==============================================================================

/// Providers - 通常在 `presentation/providers/video_providers.dart`
/// 使用 Riverpod 进行依赖注入，将各层连接起来。

// a. 提供 Dio 实例
final dioProvider = Provider<Dio>((ref) => Dio());

// b. 提供仓库实现，并注入 Dio
final videoRepositoryProvider = Provider<VideoRepository>((ref) {
  return VideoRepositoryImpl(ref.watch(dioProvider));
});

// c. 提供用例，并注入仓库
final getVideosUseCaseProvider = Provider<GetVideosUseCase>((ref) {
  return GetVideosUseCase(ref.watch(videoRepositoryProvider));
});

// d. 创建 FutureProvider 来执行用例，这是 UI 将要监听的 Provider
final videosProvider = FutureProvider<List<VideoItem>>((ref) {
  return ref.watch(getVideosUseCaseProvider).call();
});

/// 页面 (View) - 通常在 `presentation/pages/clean_architecture_demo_page.dart`
class CleanArchitectureDemoPage extends ConsumerWidget {
  const CleanArchitectureDemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // UI 监听 `videosProvider` 的状态
    final asyncVideos = ref.watch(videosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Architecture 演示'),
      ),
      // 使用 `when` 优雅地处理加载、成功和错误三种状态
      body: asyncVideos.when(
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
        error: (err, stack) => Center(child: Text('加载出错: $err')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
