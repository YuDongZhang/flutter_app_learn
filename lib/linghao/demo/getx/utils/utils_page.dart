import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 工具类示例页面
class UtilsPage extends StatelessWidget {
  const UtilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('工具类 (Utils)'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSnackbarExample(),
              _buildDialogExample(),
              _buildBottomSheetExample(),
              _buildDeviceInfoExample(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSnackbarExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.snackbar()', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('显示一个轻量级的提示条。'),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('显示 Snackbar'),
              onPressed: () {
                Get.snackbar(
                  '标题',
                  '这是一条来自 GetX 的消息。',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.blueAccent,
                  colorText: Colors.white,
                  icon: const Icon(Icons.info, color: Colors.white),
                  duration: const Duration(seconds: 3),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.dialog()', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('显示一个标准的对话框。'),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('显示 Dialog'),
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: const Text('确认操作'),
                    content: const Text('您确定要执行此操作吗？'),
                    actions: [
                      TextButton(
                        child: const Text('取消'),
                        onPressed: () => Get.back(),
                      ),
                      TextButton(
                        child: const Text('确定'),
                        onPressed: () {
                          Get.back(); // 关闭对话框
                          Get.snackbar('操作完成', '您已点击确定');
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheetExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.bottomSheet()', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('从底部弹出一个面板。'),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('显示 BottomSheet'),
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('这是一个底部面板', style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => Get.back(),
                          child: const Text('关闭'),
                        )
                      ],
                    ),
                  ),
                  // isScrollControlled: true, // 如果内容过高，允许滚动
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceInfoExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('设备与上下文信息', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('无需 `context` 即可获取设备信息。'),
            const SizedBox(height: 10),
            Text('屏幕宽度: ${Get.width.toStringAsFixed(2)}'),
            Text('屏幕高度: ${Get.height.toStringAsFixed(2)}'),
            Text('是否为深色模式: ${Get.isDarkMode}'),
            Text(
                '是否为横屏: ${Get.mediaQuery.orientation == Orientation.landscape}'),
          ],
        ),
      ),
    );
  }
}
