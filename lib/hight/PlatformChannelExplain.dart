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
          const Text('更多内容可参考官方文档：'),
          const Text('https://docs.flutter.dev/development/platform-integration/platform-channels', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
} 