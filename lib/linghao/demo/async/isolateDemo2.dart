import 'dart:convert'; // 用于 jsonEncode 和 jsonDecode
import 'dart:isolate'; // 用于 Isolate.run()
import 'package:flutter/material.dart';

// 这是一个将在新 Isolate 中运行的函数。
// 注意：它必须是一个顶级函数或静态方法。
// 它接收一个 JSON 字符串，解析它，并返回解析后列表的长度。
int _parseAndCount(String jsonString) {
  // 模拟一些繁重的解析工作
  final List<dynamic> data = jsonDecode(jsonString);
  // 在这里，您可以将 `data` 映射到您的 Dart
  // 模型对象 (POJO)，这通常是实际应用中耗时的部分。
  return data.length;
}

// 辅助函数，用于生成一个非常大的（伪造的）JSON 字符串。
String _generateFakeLargeJson(int count) {
  final List<Map<String, dynamic>> items = [];
  for (int i = 0; i < count; i++) {
    items.add({
      'id': i,
      'name': 'Item $i',
      'description': '这是一个示例描述，用于增加字符串的体积。',
      'value': i * 1.5,
      'active': i % 2 == 0,
    });
  }
  // 将 Dart 列表编码为 JSON 字符串
  return jsonEncode(items);
}

class JsonParseDemoPage extends StatefulWidget {
  const JsonParseDemoPage({super.key});

  @override
  State<JsonParseDemoPage> createState() => _JsonParseDemoPageState();
}

class _JsonParseDemoPageState extends State<JsonParseDemoPage> {
  String _message = '点击按钮开始解析';
  bool _isLoading = false;
  String? _generatedJsonString; // 存储生成的 JSON 字符串

  // 生成大型 JSON
  Future<void> _generateJson() async {
    setState(() {
      _isLoading = true;
      _message = '正在生成 1,000,000 个条目的大型 JSON...';
    });

    // 同样，生成一个巨大的字符串也可能需要时间，
    // 所以我们也可以在 isolate 中执行此操作，或者至少使用 Future.delayed
    // 来允许 UI 更新。
    // 为简单起见，我们在这里使用 `Isolate.run`。
    try {
      final String jsonStr = await Isolate.run(
        () => _generateFakeLargeJson(1000000), // 生成 100 万个条目
      );
      _generatedJsonString = jsonStr;
      setState(() {
        _isLoading = false;
        _message = 'JSON 已生成 (大约 ${(_generatedJsonString!.length / 1024 / 1024).toStringAsFixed(2)} MB)\n点击 "开始解析"';
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _message = '生成 JSON 时出错: $e';
      });
    }
  }

  // 使用 Isolate.run() 开始解析
  Future<void> _startParsing() async {
    if (_generatedJsonString == null) {
      setState(() {
        _message = '请先生成 JSON！';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _message = '正在 Isolate 中解析 JSON...';
    });

    try {
      // 这就是关键！
      // Isolate.run() 会在一个新的 Isolate 中执行给定的函数。
      // 它返回一个 Future，该 Future 会在 Isolate 完成工作后
      // 带着结果（或错误）完成。
      //
      // 我们传递一个闭包 () => _parseAndCount(_generatedJsonString!)
      // 以便将我们的 JSON 字符串作为参数传递给顶级函数。
      final int count = await Isolate.run(
        () => _parseAndCount(_generatedJsonString!),
      );

      // 工作完成，更新 UI
      setState(() {
        _isLoading = false;
        _message = '解析完成！\n在 Isolate 中找到了 $count 个条目。';
      });
    } catch (e) {
      // 处理 Isolate 中可能发生的任何错误
      setState(() {
        _isLoading = false;
        _message = '解析时出错: $e';
      });
    }
  }

  // 不使用 Isolate，在主线程上解析（用于对比）
  void _parseOnMainThread() {
    if (_generatedJsonString == null) {
      setState(() {
        _message = '请先生成 JSON！';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _message = '正在主线程解析 JSON... (UI 将会卡住!)';
    });

    // 强制 UI 刷新，以便我们能看到 "Loading" 消息
    Future.delayed(const Duration(milliseconds: 50), () {
      try {
        // !! 警告 !!
        // 下面的这行代码将导致 UI 冻结（卡顿），
        // 因为它在主 Isolate 上执行繁重的工作。
        final int count = _parseAndCount(_generatedJsonString!);

        // 工作完成，更新 UI
        setState(() {
          _isLoading = false;
          _message = '主线程解析完成！\n找到了 $count 个条目。\n(你注意到卡顿了吗？)';
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
          _message = '解析时出错: $e';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isolate.run() 解析 JSON'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 加载指示器
              if (_isLoading)
                const CircularProgressIndicator()
              else
                const Icon(Icons.check_circle_outline, color: Colors.green, size: 48),

              const SizedBox(height: 20),

              // 显示结果消息
              Text(
                _message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),

              // 按钮
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // 如果正在加载，则禁用按钮
                onPressed: _isLoading ? null : _generateJson,
                child: const Text('1. 生成大型 JSON'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: (_isLoading || _generatedJsonString == null) ? null : _startParsing,
                child: const Text('2. 在 Isolate 中解析 (安全)'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: (_isLoading || _generatedJsonString == null) ? null : _parseOnMainThread,
                child: const Text('3. 在主线程解析 (危险)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
