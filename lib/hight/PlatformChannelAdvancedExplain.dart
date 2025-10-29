import 'package:flutter/material.dart';

class PlatformChannelAdvancedPage extends StatelessWidget {
  const PlatformChannelAdvancedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('平台通道高级用法'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '平台通道多种通信方式',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text('除了基本的MethodChannel，Flutter还提供了多种与原生平台通信的方式，包括EventChannel、BasicMessageChannel等。'),
          const SizedBox(height: 16),
          
          const Text('1. MethodChannel（方法通道）', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('用于调用原生方法并获取返回值，是最常用的通道类型。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              """
// Flutter端
static const platform = MethodChannel('samples.flutter.dev/battery');
Future<void> getBatteryLevel() async {
  final int result = await platform.invokeMethod('getBatteryLevel');
  print('电量: \$result');
}

// Android端
MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
    .setMethodCallHandler { call, result ->
        if (call.method == "getBatteryLevel") {
            val batteryLevel = getBatteryLevel()
            result.success(batteryLevel)
        }
    }
              """,
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('2. EventChannel（事件通道）', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('用于从原生端向Flutter端发送连续的事件流，如传感器数据、位置更新等。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              """
// Flutter端
static const eventChannel = EventChannel('samples.flutter.dev/sensor');
Stream<double> get sensorData {
  return eventChannel.receiveBroadcastStream().map((data) => data as double);
}

// Android端
EventChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
    .setStreamHandler(object : EventChannel.StreamHandler {
        override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
            // 开始发送事件
            events.success(sensorData)
        }
        override fun onCancel(arguments: Any?) {
            // 停止发送事件
        }
    })
              """,
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('3. BasicMessageChannel（基础消息通道）', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('用于简单的消息传递，支持自定义编解码器。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              """
// Flutter端
static const messageChannel = BasicMessageChannel<String>(
    'samples.flutter.dev/message',
    StringCodec(),
);
Future<String> sendMessage(String message) async {
  return await messageChannel.send(message);
}

// Android端
BasicMessageChannel(flutterEngine.dartExecutor.binaryMessenger, 
    CHANNEL, StringCodec.INSTANCE)
    .setMessageHandler { message, reply ->
        reply.reply("收到消息: \$message")
    }
              """,
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('4. 使用SharedPreferences实现数据存储传递', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('通过平台通道与原生SharedPreferences交互，实现数据的持久化存储。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              """
// Flutter端 - 保存数据到原生SharedPreferences
Future<void> saveToSP(String key, String value) async {
  await platform.invokeMethod('saveToSharedPreferences', {
    'key': key,
    'value': value,
  });
}

// Flutter端 - 从原生SharedPreferences读取数据
Future<String?> readFromSP(String key) async {
  return await platform.invokeMethod('readFromSharedPreferences', {'key': key});
}

// Android端 - 处理SharedPreferences操作
if (call.method == "saveToSharedPreferences") {
    val key = call.argument<String>("key")
    val value = call.argument<String>("value")
    val prefs = getSharedPreferences("my_prefs", Context.MODE_PRIVATE)
    prefs.edit().putString(key, value).apply()
    result.success(null)
} else if (call.method == "readFromSharedPreferences") {
    val key = call.argument<String>("key")
    val prefs = getSharedPreferences("my_prefs", Context.MODE_PRIVATE)
    val value = prefs.getString(key, null)
    result.success(value)
}
              """,
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('5. 双向通信示例', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Flutter与原生端的双向通信，支持方法调用和事件监听。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              """
// Flutter端 - 双向通信管理
class PlatformCommunicator {
  static const platform = MethodChannel('samples.flutter.dev/communication');
  static const eventChannel = EventChannel('samples.flutter.dev/events');
  
  // 调用原生方法
  Future<String> callNativeMethod(String method, [dynamic args]) async {
    return await platform.invokeMethod(method, args);
  }
  
  // 监听原生事件
  Stream<dynamic> get nativeEvents {
    return eventChannel.receiveBroadcastStream();
  }
  
  // 设置方法处理器（供原生调用）
  Future<void> setupMethodHandler() async {
    platform.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'fromNative':
          // 处理来自原生的调用
          return '处理完成';
        default:
          throw PlatformException(
            code: '未实现',
            message: '方法\${call.method}未实现',
          );
      }
    });
  }
}
              """,
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('使用步骤总结：', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('1. 根据需求选择合适的通道类型\n2. 在Flutter端创建通道实例\n3. 在原生端注册相应的处理器\n4. 实现具体的业务逻辑\n5. 处理错误和异常情况\n6. 测试双向通信功能'),
          const SizedBox(height: 16),
          
          const Text('注意事项：', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('• 通道名称必须在Flutter和原生端保持一致\n• 数据类型转换要正确处理\n• 异步操作要使用await或then处理\n• 错误处理要完善，避免应用崩溃\n• 性能考虑：频繁通信可能影响应用性能'),
          const SizedBox(height: 16),
          
          const Text('更多内容可参考官方文档：'),
          const Text('https://docs.flutter.dev/development/platform-integration/platform-channels', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}