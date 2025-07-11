import 'package:flutter/material.dart';

class SnackBarDemoPage extends StatefulWidget {
  const SnackBarDemoPage({super.key});

  @override
  State<SnackBarDemoPage> createState() => _SnackBarDemoPageState();
}

class _SnackBarDemoPageState extends State<SnackBarDemoPage> {
  void _showSnackBar(String message, {SnackBarAction? action, Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: action,
        backgroundColor: backgroundColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SnackBar 消息提示控件详解')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.blue[50],
            margin: const EdgeInsets.only(bottom: 24),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('学习导引', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('SnackBar 用于页面底部的消息提示，支持操作按钮、自动消失、样式自定义等。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 SnackBar 的基本用法、操作按钮、自定义样式、最佳实践等。'),
                ],
              ),
            ),
          ),
          _SnackBarSection(
            title: '基本用法',
            description: 'ScaffoldMessenger.of(context).showSnackBar 可弹出消息提示。',
            code: '''ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('消息')),
);''',
            demo: ElevatedButton(
              onPressed: () => _showSnackBar('这是一个普通 SnackBar'),
              child: const Text('弹出 SnackBar'),
            ),
          ),
          const SizedBox(height: 24),
          _SnackBarSection(
            title: '带操作按钮',
            description: 'SnackBar 支持 action，可添加操作按钮。',
            code: '''SnackBar(
  content: Text('消息'),
  action: SnackBarAction(
    label: '撤销',
    onPressed: () {},
  ),
)''',
            demo: ElevatedButton(
              onPressed: () => _showSnackBar(
                '带操作按钮',
                action: SnackBarAction(
                  label: '撤销',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('已撤销')),
                    );
                  },
                ),
              ),
              child: const Text('弹出带操作按钮的 SnackBar'),
            ),
          ),
          const SizedBox(height: 24),
          _SnackBarSection(
            title: '自定义样式',
            description: '可自定义背景色、内容、持续时间等。',
            code: '''SnackBar(
  content: Text('自定义样式'),
  backgroundColor: Colors.green,
  duration: Duration(seconds: 2),
)''',
            demo: ElevatedButton(
              onPressed: () => _showSnackBar(
                '自定义样式',
                backgroundColor: Colors.green,
              ),
              child: const Text('弹出自定义样式 SnackBar'),
            ),
          ),
          const SizedBox(height: 24),
          _SnackBarSection(
            title: '最佳实践',
            description: '''1. 建议用 ScaffoldMessenger 弹出。
2. 避免频繁弹出多个 SnackBar。
3. 可结合 action 实现撤销等操作。
4. 可自定义样式和持续时间。''',
            code: '''ScaffoldMessenger.of(context).showSnackBar(...);''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
    );
  }
}

class _SnackBarSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _SnackBarSection({
    required this.title,
    required this.description,
    required this.code,
    required this.demo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: const EdgeInsets.all(8),
              child: Text(code, style: const TextStyle(fontFamily: 'monospace', fontSize: 14)),
            ),
            const SizedBox(height: 12),
            demo,
          ],
        ),
      ),
    );
  }
} 