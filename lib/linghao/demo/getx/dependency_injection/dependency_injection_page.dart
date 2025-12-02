import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'di_controller.dart';
import 'di_service.dart';

/// 依赖注入示例页面
class DependencyInjectionPage extends StatelessWidget {
  DependencyInjectionPage({super.key});

  // 在页面构建时，我们不会立即注入 DIController。
  // 我们将在下面的方法中根据用户的操作来演示注入。

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('依赖注入'),
        // 当页面销毁时，清理掉所有本页面注入的控制器
        // 这是良好的实践，避免内存泄漏
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: '清理所有依赖',
            onPressed: () {
              // Get.delete 会移除实例，并触发 onClose 方法
              Get.delete<DIController>();
              Get.delete<DIService>();
              Get.snackbar('清理完成', 'DIController 和 DIService 已被移除');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPutExample(),
            _buildLazyPutExample(),
            _buildFindAndUseExample(),
            _buildServiceExample(),
            _buildInfoCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildPutExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.put()', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('立即创建并注入一个依赖。如果依赖已存在，会返回已存在的实例。'),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Get.put<DIController>()'),
              onPressed: () {
                // 注入 DIController，如果已经存在则不会重复创建
                Get.put(DIController());
                Get.snackbar('注入成功', 'DIController 已被 put (立即创建)');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLazyPutExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.lazyPut()', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('懒加载一个依赖。只在第一次使用 Get.find() 时才会被创建。'),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Get.lazyPut<DIController>()'),
              onPressed: () {
                // 懒加载 DIController。注意：如果已经put了，lazyPut不会生效
                Get.lazyPut(() => DIController());
                Get.snackbar('注册成功', 'DIController 已被 lazyPut (使用时创建)');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFindAndUseExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.find()', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('查找并返回一个已注册的依赖。如果依赖未注册或未创建，会抛出异常。'),
            const SizedBox(height: 10),
            // 使用 Get.isRegistered 检查依赖是否被注册 (put 或 lazyPut)
            Obx(() => Text('DIController 是否已注册: ${Get.isRegistered<DIController>()}')),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Get.find<DIController>() 并使用'),
              onPressed: () {
                try {
                  // 查找依赖
                  final controller = Get.find<DIController>();
                  // 使用它
                  controller.increment();
                  Get.snackbar(
                    '使用成功',
                    'count in DIController is now ${controller.count.value}',
                  );
                } catch (e) {
                  Get.snackbar(
                    '错误',
                    '找不到 DIController。请先 put 或 lazyPut 它。\n$e',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }
              },
            ),
            // 显示控制器中的值
            Obx(() {
              if (Get.isRegistered<DIController>()) {
                return Text('Controller Count: ${Get.find<DIController>().count.value}',
                    style: const TextStyle(fontSize: 20));
              }
              return const Text('Controller Count: (未注入)', style: TextStyle(fontSize: 20));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('GetxService', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('一种特殊的控制器，不会被自动销毁，适合存放持久化服务。'),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Get.put<DIService>()'),
              onPressed: () {
                Get.put(DIService());
                Get.snackbar('注入成功', 'DIService 已被 put');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return const Card(
      color: Colors.amber,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '提示: \n'
          '1. `Get.put()`: 适合需要立即使用的依赖.\n'
          '2. `Get.lazyPut()`: 适合当前不需要但未来可能使用的依赖，节省资源.\n'
          '3. `GetxService`: 适合全局、持久化的服务 (如API, 数据库)。\n'
          '4. 页面关闭时记得用 `Get.delete()` 清理仅限该页面的依赖。',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
