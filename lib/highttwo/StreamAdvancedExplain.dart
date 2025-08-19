import 'package:flutter/material.dart';

class StreamAdvancedExplainPage extends StatelessWidget {
  const StreamAdvancedExplainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream 讲解')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('讲解', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          const Text('Stream 是 Dart 中用于处理异步事件流的数据结构，适合处理一系列异步数据（如网络请求、用户输入、定时器等）。'),
          const SizedBox(height: 16),
          const Text('示例代码', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
Stream<int> countStream() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  await for (var value in countStream()) {
    print(value);
  }
}
// 每秒输出一个数字，共输出 1、2、3
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          const Text('实例演示', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const StreamDemoWidget(),
        ],
      ),
    );
  }
}

class StreamDemoWidget extends StatefulWidget {
  const StreamDemoWidget({super.key});
  @override
  State<StreamDemoWidget> createState() => _StreamDemoWidgetState();
}

class _StreamDemoWidgetState extends State<StreamDemoWidget> {
  final List<int> _values = [];
  bool _running = false;

  Stream<int> countStream() async* {
    for (int i = 1; i <= 3; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  Future<void> _runStreamDemo() async {
    setState(() {
      _values.clear();
      _running = true;
    });
    await for (var value in countStream()) {
      setState(() {
        _values.add(value);
      });
    }
    setState(() {
      _running = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Stream 输出: ${_values.join(', ')}'),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _running ? null : _runStreamDemo,
          child: const Text('运行 Stream 演示'),
        ),
      ],
    );
  }
} 