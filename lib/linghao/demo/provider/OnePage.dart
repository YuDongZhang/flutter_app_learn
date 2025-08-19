import 'package:flutter/material.dart';
import 'package:flutter_app_learn/linghao/demo/provider/OneProvider.dart';
import 'package:provider/provider.dart';

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  late OneProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<OneProvider>(context, listen: false); // 初始化 OneProvider
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
            // 使用 Consumer 监听 OneProvider 的 counter 值
            Consumer<OneProvider>(
              builder: (context, provider, child) {
                return Text(
                  '计数: ${provider.counter}',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _provider.incrementCounter, // 点击增加计数
              child: const Text('增加'),
            ),
          ],
        ),
      ),
    );
  }
}
