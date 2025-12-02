import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

/// 状态管理示例页面
class StateManagementPage extends StatelessWidget {
  StateManagementPage({super.key});

  // 使用 Get.put() 将控制器注入到依赖中，使其在子路由中可用。
  // lazy: false 确保控制器立即被创建。
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('状态管理'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildReactiveExample(),
            const SizedBox(height: 40),
            _buildSimpleExample(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '说明:\n' 
                '响应式管理 (Obx) 代码更简洁，变量变化时自动更新。\n' 
                '简单状态管理 (GetBuilder) 需要手动调用 `update()`，性能更好，适用于更复杂的场景。',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 响应式状态管理示例 (Obx)
  Widget _buildReactiveExample() {
    return Column(
      children: [
        const Text(
          '响应式状态管理 (Obx)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // Obx 包裹的 Widget 会在响应式变量变化时自动重建
        Obx(() {
          return Text(
            '点击了 ${controller.count1.value} 次',
            style: const TextStyle(fontSize: 24),
          );
        }),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => controller.increment1(),
          child: const Text('增加 count1'),
        ),
      ],
    );
  }

  /// 简单状态管理示例 (GetBuilder)
  Widget _buildSimpleExample() {
    return Column(
      children: [
        const Text(
          '简单状态管理 (GetBuilder)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // GetBuilder 包裹的 Widget 会在调用 update() 时重建
        GetBuilder<CounterController>(
          builder: (c) {
            return Text(
              '点击了 ${c.count2} 次',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => controller.increment2(),
          child: const Text('增加 count2'),
        ),
      ],
    );
  }
}
