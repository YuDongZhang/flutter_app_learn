import 'package:flutter/material.dart';

class PlatformChannelPage extends StatelessWidget {
  const PlatformChannelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('平台通道讲解'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '平台通道（Platform Channel）',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text('Platform Channel 是 Flutter 与原生(Android/iOS)通信的机制。常用于调用原生功能，如相机、定位、蓝牙等。'),
          const SizedBox(height: 16),
          const Text('示例：Flutter 调用原生方法', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              """
// Dart 端
static const platform = MethodChannel('samples.flutter.dev/battery');
Future<void> getBatteryLevel() async {
  final int result = await platform.invokeMethod('getBatteryLevel');
  print('电量: \$result');
}

// Android 端 (Kotlin)
class MainActivity: FlutterActivity() {
  private val CHANNEL = "samples.flutter.dev/battery"
  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      if (call.method == "getBatteryLevel") {
        val batteryLevel = ... // 获取电量
        result.success(batteryLevel)
      }
    }
  }
}
              """,
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          const Text('使用步骤：', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('1. 在 Flutter 端创建 MethodChannel 实例\n   - 使用 MethodChannel 构造函数，传入唯一的通道名称\n   - 例如：static const platform = MethodChannel(\'samples.flutter.dev/battery\')\n\n2. 定义原生方法调用\n   - 使用 invokeMethod 方法调用原生方法\n   - 可以传递参数给原生端\n   - 例如：final result = await platform.invokeMethod(\'getBatteryLevel\')\n\n3. 在原生端注册方法处理器\n   - Android: 在 MainActivity 的 configureFlutterEngine 方法中注册\n   - iOS: 在 AppDelegate 的 didFinishLaunchingWithOptions 方法中注册\n\n4. 处理具体业务逻辑\n   - 在原生端实现具体功能（如获取电量、调用相机等）\n   - 根据方法名进行不同的业务处理\n\n5. 返回结果给 Flutter 端\n   - 使用 result.success() 返回成功结果\n   - 使用 result.error() 返回错误信息\n   - Flutter 端通过 await 等待结果返回'),
          const SizedBox(height: 16),
          const Text('更多内容可参考官方文档：'),
          const Text('https://docs.flutter.dev/development/platform-integration/platform-channels', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}