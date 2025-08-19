import 'dart:async';

import 'package:flutter/material.dart';

class AsyncAdvancedExplainPage extends StatelessWidget {
  const AsyncAdvancedExplainPage({super.key});

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
      appBar: AppBar(title: const Text('异步编程进阶')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Future
          Row(
            children: const [
              Chip(label: Text('Future', style: TextStyle(color: Colors.white)), backgroundColor: Colors.blue),
              SizedBox(width: 8),
              Text('一次性异步结果'),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Future 表示一个“将来才会完成”的异步操作，常用于 async/await。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
Future<int> getData() async {
  await Future.delayed(Duration(seconds: 1));
  return 42;
}
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () => _showExampleDialog(context, const FutureDemoWidget(), 'Future 示例'),
              child: const Text('查看示例'),
            ),
          ),
          const Divider(height: 32),

          // Stream
          Row(
            children: const [
              Chip(label: Text('Stream', style: TextStyle(color: Colors.white)), backgroundColor: Colors.green),
              SizedBox(width: 8),
              Text('异步数据流'),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Stream 适合处理一系列异步数据（如用户输入、定时器等），可多次输出。'),
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
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () => _showExampleDialog(context, const StreamDemoWidget(), 'Stream 示例'),
              child: const Text('查看示例'),
            ),
          ),
          const Divider(height: 32),

          // 事件循环
          Row(
            children: const [
              Chip(label: Text('事件循环', style: TextStyle(color: Colors.white)), backgroundColor: Colors.orange),
              SizedBox(width: 8),
              Text('调度异步任务'),
            ],
          ),
          const SizedBox(height: 8),
          const Text('事件循环（Event Loop）负责调度和执行所有异步任务，协调微任务队列和事件队列的执行顺序。'),
          const Divider(height: 32),

          // 微任务队列
          Row(
            children: const [
              Chip(label: Text('微任务队列', style: TextStyle(color: Colors.white)), backgroundColor: Colors.purple),
              SizedBox(width: 8),
              Text('优先级高于事件队列'),
            ],
          ),
          const SizedBox(height: 8),
          const Text('微任务队列存放优先级更高的异步任务（如 scheduleMicrotask、Future.microtask）。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
scheduleMicrotask(() => print('microtask'));
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () => _showExampleDialog(context, const MicrotaskDemoWidget(), '微任务队列示例'),
              child: const Text('查看示例'),
            ),
          ),
          const Divider(height: 32),

          // 事件队列
          Row(
            children: const [
              Chip(label: Text('事件队列', style: TextStyle(color: Colors.white)), backgroundColor: Colors.red),
              SizedBox(width: 8),
              Text('普通异步事件'),
            ],
          ),
          const SizedBox(height: 8),
          const Text('事件队列存放普通的异步事件（如 Future、Timer、IO、用户事件等）。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
Future(() => print('event'));
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () => _showExampleDialog(context, const EventQueueDemoWidget(), '事件队列示例'),
              child: const Text('查看示例'),
            ),
          ),
          const Divider(height: 32),

          // 执行顺序举例
          const Text('执行顺序举例', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
void main() {
  scheduleMicrotask(() => print('microtask'));
  Future(() => print('event'));
  print('main');
}
// 输出顺序：main -> microtask -> event
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
        ],
      ),
    );
  }
}

// Future 示例
class FutureDemoWidget extends StatefulWidget {
  const FutureDemoWidget({super.key});
  @override
  State<FutureDemoWidget> createState() => _FutureDemoWidgetState();
}
class _FutureDemoWidgetState extends State<FutureDemoWidget> {
  String _result = '点击按钮演示 Future';
  Future<void> _runDemo() async {
    setState(() => _result = '等待 1 秒...');
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _result = 'Future 完成！');
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
          onPressed: _runDemo,
          child: const Text('运行 Future'),
        ),
      ],
    );
  }
}

// Stream 示例
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Stream 输出: ${_values.join(', ')}'),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _running ? null : _runStreamDemo,
          child: const Text('运行 Stream'),
        ),
      ],
    );
  }
}

// 微任务队列示例
class MicrotaskDemoWidget extends StatelessWidget {
  const MicrotaskDemoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('点击按钮查看微任务队列输出顺序（控制台查看效果）'),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            scheduleMicrotask(() => print('microtask'));
            Future(() => print('event'));
            print('main');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('请查看控制台输出顺序')),);
          },
          child: const Text('运行微任务队列示例'),
        ),
      ],
    );
  }
}

// 事件队列示例
class EventQueueDemoWidget extends StatelessWidget {
  const EventQueueDemoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('点击按钮查看事件队列输出顺序（控制台查看效果）'),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            Future(() => print('event'));
            print('main');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('请查看控制台输出顺序')),);
          },
          child: const Text('运行事件队列示例'),
        ),
      ],
    );
  }
} 