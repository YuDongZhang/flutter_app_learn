import 'package:flutter/material.dart';

enum _Option { A, B, C }

class SimpleDialogDemoPage extends StatefulWidget {
  const SimpleDialogDemoPage({super.key});

  @override
  State<SimpleDialogDemoPage> createState() => _SimpleDialogDemoPageState();
}

class _SimpleDialogDemoPageState extends State<SimpleDialogDemoPage> {
  String _choice = '无';

  Future<void> _openSimpleDialog() async {
    final option = await showDialog<_Option>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('请选择一个选项'),
        children: [
          SimpleDialogOption(
            child: const Text('选项A'),
            onPressed: () => Navigator.pop(context, _Option.A),
          ),
          SimpleDialogOption(
            child: const Text('选项B'),
            onPressed: () => Navigator.pop(context, _Option.B),
          ),
          SimpleDialogOption(
            child: const Text('选项C'),
            onPressed: () => Navigator.pop(context, _Option.C),
          ),
        ],
      ),
    );
    if (option != null) {
      setState(() {
        _choice = option.name;
      });
    }
  }

  Future<void> _openCustomDialog() async {
    await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('自定义内容'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('这里可以放任意自定义内容'),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('关闭'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SimpleDialog 简单对话框控件详解')),
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
                  Text('SimpleDialog 用于弹出简单的选项对话框，常用于选择、提示等场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 SimpleDialog 的基本用法、选项选择、自定义内容、最佳实践等。'),
                ],
              ),
            ),
          ),
          _SimpleDialogSection(
            title: '基本用法',
            description: 'SimpleDialog 可弹出选项列表，onPressed 关闭并返回选项。',
            code: '''showDialog(
  context: context,
  builder: (context) => SimpleDialog(
    title: Text('标题'),
    children: [
      SimpleDialogOption(
        child: Text('A'),
        onPressed: () => Navigator.pop(context, 'A'),
      ),
      ...
    ],
  ),
);''',
            demo: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('当前选择: $_choice'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _openSimpleDialog,
                  child: const Text('弹出选项对话框'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _SimpleDialogSection(
            title: '自定义内容',
            description: 'SimpleDialog 支持自定义内容，可放表单、图片等任意 Widget。',
            code: '''SimpleDialog(
  title: Text('自定义'),
  children: [
    Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('自定义内容'),
          ElevatedButton(...),
        ],
      ),
    ),
  ],
)''',
            demo: ElevatedButton(
              onPressed: _openCustomDialog,
              child: const Text('弹出自定义内容对话框'),
            ),
          ),
          const SizedBox(height: 24),
          _SimpleDialogSection(
            title: '最佳实践',
            description: '''1. 适合简单选项选择。
2. 复杂内容建议用 AlertDialog。
3. 建议用 showDialog 弹出。
4. 可结合 Future 获取返回值。''',
            code: '''final result = await showDialog(...);''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openSimpleDialog,
        child: const Icon(Icons.format_list_numbered),
        tooltip: '弹出选项对话框',
      ),
    );
  }
}

class _SimpleDialogSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _SimpleDialogSection({
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