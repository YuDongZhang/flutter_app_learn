import 'dart:isolate';
import 'package:flutter/material.dart';

class IsolateAdvancedExplainPage extends StatelessWidget {
  const IsolateAdvancedExplainPage({super.key});

  void _showExampleDialog(BuildContext context, Widget example, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: example,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('多线程与并发')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Isolate 基础
          Row(
            children: const [
              Chip(label: Text('Isolate', style: TextStyle(color: Colors.white)), backgroundColor: Colors.blue),
              SizedBox(width: 8),
              Text('Dart 的多线程模型'),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Isolate 是 Dart 中的轻量级线程，每个 Isolate 有独立的内存空间，适合 CPU 密集型任务。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
import 'dart:isolate';

void heavyTask(SendPort sendPort) {
  // 在独立线程中执行耗时任务
  int result = 0;
  for (int i = 0; i < 1000000; i++) {
    result += i;
  }
  sendPort.send(result);
}

void main() async {
  final receivePort = ReceivePort();
  await Isolate.spawn(heavyTask, receivePort.sendPort);
  final result = await receivePort.first;
  print('计算结果: \$result');
}
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () => _showExampleDialog(context, const IsolateDemoWidget(), 'Isolate 示例'),
              child: const Text('查看示例'),
            ),
          ),
          const Divider(height: 32),

          // 通信机制
          Row(
            children: const [
              Chip(label: Text('通信机制', style: TextStyle(color: Colors.white)), backgroundColor: Colors.green),
              SizedBox(width: 8),
              Text('SendPort 和 ReceivePort'),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Isolate 之间通过 SendPort 和 ReceivePort 进行通信，只能传递可序列化的数据。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
void worker(SendPort sendPort) {
  sendPort.send('Hello from Isolate!');
}

void main() async {
  final receivePort = ReceivePort();
  await Isolate.spawn(worker, receivePort.sendPort);
  final message = await receivePort.first;
  print(message); // 输出: Hello from Isolate!
}
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const Divider(height: 32),

          // 实际应用
          Row(
            children: const [
              Chip(label: Text('实际应用', style: TextStyle(color: Colors.white)), backgroundColor: Colors.orange),
              SizedBox(width: 8),
              Text('常见使用场景'),
            ],
          ),
          const SizedBox(height: 8),
          const Text('• 图像处理：在后台线程处理图片压缩、滤镜等\n• 数据处理：大量数据的计算和分析\n• 网络请求：在独立线程中处理耗时请求\n• 文件操作：大文件的读写操作'),
        ],
      ),
    );
  }
}

// Isolate 示例
class IsolateDemoWidget extends StatefulWidget {
  const IsolateDemoWidget({super.key});
  @override
  State<IsolateDemoWidget> createState() => _IsolateDemoWidgetState();
}

class _IsolateDemoWidgetState extends State<IsolateDemoWidget> {
  String _result = '点击按钮在 Isolate 中执行耗时计算';
  bool _running = false;

  void _heavyTask(SendPort sendPort) {
    // 模拟耗时计算
    int result = 0;
    for (int i = 0; i < 1000000; i++) {
      result += i;
    }
    sendPort.send(result);
  }

  Future<void> _runIsolateDemo() async {
    setState(() {
      _result = '正在 Isolate 中计算...';
      _running = true;
    });

    try {
      final receivePort = ReceivePort();
      await Isolate.spawn(_heavyTask, receivePort.sendPort);
      final result = await receivePort.first;
      setState(() {
        _result = '计算结果: $result';
        _running = false;
      });
    } catch (e) {
      setState(() {
        _result = '计算失败: $e';
        _running = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_result),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _running ? null : _runIsolateDemo,
          child: const Text('运行 Isolate 示例'),
        ),
      ],
    );
  }
} 