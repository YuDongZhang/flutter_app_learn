import 'package:flutter/material.dart';

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  int _counter = 0; // 状态：计数器值

  void _incrementCounter() {
    setState(() {
      _counter++; // 更新状态，触发 UI 重建
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动态页面 (StatefulWidget)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '这是一个 StatefulWidget',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '计数: $_counter',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _incrementCounter, // 点击增加计数
              child: const Text('增加'),
            ),
          ],
        ),
      ),
    );
  }
}