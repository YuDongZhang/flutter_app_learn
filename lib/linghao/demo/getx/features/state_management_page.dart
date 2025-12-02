import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 1. 创建一个控制器 (Controller)
class CounterController extends GetxController {
  // 使用 .obs 使变量变为响应式
  final count = 0.obs;
  final text = 'Hello'.obs;

  // 普通变量，需要手动 update() 
  int simpleCount = 0;

  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }

  void updateText(String newText) {
    text.value = newText;
  }

  void incrementSimple() {
    simpleCount++;
    update(); // 调用 update() 来通知 GetBuilder 重建
  }
}

class StateManagementPage extends StatelessWidget {
  const StateManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. 实例化控制器
    // 使用 Get.put() 将控制器注入到依赖中，使其在子组件中可用
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('状态管理'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showInfoDialog(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildReactiveExample(controller),
            const SizedBox(height: 24),
            _buildSimpleExample(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildReactiveExample(CounterController controller) {
    final TextEditingController textEditingController = TextEditingController();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('响应式状态管理 (Obx)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('使用 .obs 和 Obx() 来自动更新UI。当响应式变量的值改变时，包裹它的 Obx 会自动重建。'),
            const SizedBox(height: 16),
            // 3. 使用 Obx() 包裹需要响应更新的 Widget
            Obx(() => Text(
                  '计数值: ${controller.count.value}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: controller.decrement, child: const Icon(Icons.remove)),
                const SizedBox(width: 16),
                ElevatedButton(onPressed: controller.increment, child: const Icon(Icons.add)),
              ],
            ),
            const Divider(height: 32),
            Obx(() => Text(
                  '文本内容: ${controller.text.value}',
                  style: const TextStyle(fontSize: 20),
                )),
            const SizedBox(height: 8),
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: '输入新文本',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                controller.updateText(value);
                textEditingController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleExample(CounterController controller) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('简单状态管理 (GetBuilder)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('使用 GetBuilder 进行手动更新。它比 Obx 消耗更少的资源，但需要在逻辑中手动调用 update()。'),
            const SizedBox(height: 16),
            // 4. 使用 GetBuilder 包裹需要更新的 Widget
            GetBuilder<CounterController>(
              builder: (c) => Text(
                '计数值: ${c.simpleCount}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                onPressed: controller.incrementSimple,
                child: const Text('手动更新计数'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('状态管理对比'),
        content: const SingleChildScrollView(
          child: Text(
            'GetX 提供了两种状态管理方式：\n\n'
            '1. 响应式 (Reactive):\n'
            '- 使用 .obs 定义响应式变量。\n'
            '- 使用 Obx(() => ...)` 包裹组件，当变量改变时自动重建。\n'
            '- 优点: 代码简洁，自动管理。\n'
            '- 缺点: 稍微消耗更多内存。\n\n'
            '2. 简单式 (Simple):\n'
            '- 使用普通变量。\n'
            '- 使用 `GetBuilder<Controller>(...)` 包裹组件。\n'
            '- 在控制器方法中调用 `update()` 来手动触发重建。\n'
            '- 优点: 性能开销极低。\n'
            '- 缺点: 需要手动管理更新。',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }
}
