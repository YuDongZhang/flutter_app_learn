import 'package:flutter/material.dart';
import 'package:get/get.dart';

// --- 模拟的服务和控制器 ---

// 一个简单的服务，模拟数据获取
class MyService extends GetxService {
  final String id;
  MyService(this.id);

  // 模拟一个异步初始化
  Future<MyService> init() async {
    debugPrint('Service $id 初始化...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('Service $id 初始化完成!');
    return this;
  }

  String getData() {
    return '来自服务 $id 的数据';
  }

  @override
  void onClose() {
    debugPrint('Service $id 已被销毁');
    super.onClose();
  }
}

// 一个使用服务的控制器
class DIController extends GetxController {
  final String name;
  DIController(this.name);

  String get dataFromService {
    // 检查服务是否存在，然后获取
    if (Get.isRegistered<MyService>()) {
      return Get.find<MyService>().getData();
    }
    return '服务未找到';
  }

  String get dataFromTaggedService {
    // 获取带标签的服务
    if (Get.isRegistered<MyService>(tag: 'tag1')) {
      return Get.find<MyService>(tag: 'tag1').getData();
    }
    return '带标签的服务未找到';
  }

  @override
  void onInit() {
    debugPrint('控制器 $name onInit');
    super.onInit();
  }

  @override
  void onClose() {
    debugPrint('控制器 $name onClose');
    super.onClose();
  }
}

// --- 示例页面 ---

class DependencyInjectionPage extends StatelessWidget {
  const DependencyInjectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.reset() 会清除所有已注册的依赖，确保每次进入页面都是干净的环境
    // 但在真实应用中请谨慎使用
    Get.reset();

    return Scaffold(
      appBar: AppBar(title: const Text('依赖注入')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPutExample(),
          _buildLazyPutExample(),
          _buildPutAsyncExample(),
          _buildTaggedExample(),
          _buildCleanupInfo(),
        ],
      ),
    );
  }

  Widget _buildPutExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.put()', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('立即实例化并注册一个依赖。'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // 注册控制器
                final controller = Get.put(DIController('A'));
                Get.snackbar('成功', 'DIController("A") 已注册!');
                debugPrint('找到的控制器: ${Get.find<DIController>().name}');
              },
              child: const Text('Get.put(DIController)'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLazyPutExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.lazyPut()', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('懒加载依赖，只在第一次使用 Get.find() 时才实例化。'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.lazyPut(() => DIController('Lazy'), fenix: true);
                Get.snackbar('成功', 'DIController("Lazy") 已懒加载注册!');
              },
              child: const Text('Get.lazyPut(DIController)'),
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  final controller = Get.find<DIController>();
                  Get.snackbar('找到!', '找到了控制器: ${controller.name}');
                } catch (e) {
                  Get.snackbar('错误', '找不到控制器: $e');
                }
              },
              child: const Text('Get.find<DIController>()'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPutAsyncExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.putAsync()', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('注册一个需要异步初始化的依赖。'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                Get.snackbar('注册中...', '正在异步注册 MyService...');
                await Get.putAsync(() => MyService('Async').init());
                Get.snackbar('成功', 'MyService("Async") 已注册!');
              },
              child: const Text('Get.putAsync(MyService)'),
            ),
            ElevatedButton(
              onPressed: () {
                // 先注册控制器，再让它从服务中获取数据
                Get.put(DIController('B'));
                final data = Get.find<DIController>().dataFromService;
                Get.snackbar('数据', data);
              },
              child: const Text('控制器获取服务数据'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaggedExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('带标签 (tag) 的依赖', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('当需要注册同一个类的多个实例时，使用 `tag` 来区分。'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.put(MyService('Default')); // 默认实例
                Get.put(MyService('Tagged'), tag: 'tag1'); // 带标签的实例
                Get.snackbar('成功', '注册了两个 MyService 实例');
              },
              child: const Text('注册带 tag 的服务'),
            ),
            ElevatedButton(
              onPressed: () {
                final s1 = Get.find<MyService>();
                final s2 = Get.find<MyService>(tag: 'tag1');
                Get.dialog(AlertDialog(
                  title: const Text('找到的实例'),
                  content: Text('默认: ${s1.id}\n带标签: ${s2.id}'),
                  actions: [TextButton(onPressed: Get.back, child: const Text('关闭'))],
                ));
              },
              child: const Text('查找两个服务'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCleanupInfo() {
    return const Card(
      color: Colors.amberAccent,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('依赖清理', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '当包含依赖的路由被移出导航栈时，GetX 会自动清理这些依赖 (调用 onClose 方法并移除)。\n\n' 
              '- `permanent: true`: 依赖不会被自动清理。\n' 
              '- `fenix: true` (用于 lazyPut): 依赖在被移除后，下次使用时会重新创建。',
            ),
          ],
        ),
      ),
    );
  }
}
