import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UtilsPage extends StatelessWidget {
  const UtilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 工具类演示'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Get.snackbar() 演示
              //    - 功能: 显示一个轻量级的提示条 (SnackBar)。
              //    - 优点: 无需 context，可自定义样式、位置和图标。
              ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    '你好，GetX!',
                    '这是一个 SnackBar 示例。',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.amber,
                    colorText: Colors.black,
                    icon: const Icon(Icons.info_outline, color: Colors.black),
                  );
                },
                child: const Text('显示 SnackBar'),
              ),
              const SizedBox(height: 20),

              // 2. Get.dialog() 演示
              //    - 功能: 显示一个标准的对话框 (Dialog)。
              //    - 优点: 无需 context，可以包裹任何 Widget。
              ElevatedButton(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('GetX 对话框'),
                      content: const Text('这是一个通过 Get.dialog() 显示的对话框。'),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(), // 使用 Get.back() 关闭对话框
                          child: const Text('取消'),
                        ),
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text('确认'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('显示 Dialog'),
              ),
              const SizedBox(height: 20),

              // 3. Get.bottomSheet() 演示
              //    - 功能: 从屏幕底部弹出一个工作表 (BottomSheet)。
              //    - 优点: 无需 context，非常适合用于显示操作选项。
              ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 16,
                        children: <Widget>[
                          ListTile(leading: const Icon(Icons.music_note), title: const Text('音乐'), onTap: () => Get.back()),
                          ListTile(leading: const Icon(Icons.videocam), title: const Text('视频'), onTap: () => Get.back()),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text('显示 BottomSheet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
