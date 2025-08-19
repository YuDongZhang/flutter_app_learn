import 'package:flutter/material.dart';

class RadioDemoPage extends StatefulWidget {
  const RadioDemoPage({super.key});

  @override
  State<RadioDemoPage> createState() => _RadioDemoPageState();
}

class _RadioDemoPageState extends State<RadioDemoPage> {
  int _radioValue = 0;
  int _radioListTileValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio 单选框控件详解')),
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
                  Text('Radio（单选框）用于在多个选项中选择一个，常用于表单、设置等场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 Radio 的基本用法、RadioListTile 组合用法，以及如何自定义外观。'),
                ],
              ),
            ),
          ),
          _RadioSection(
            title: '基本用法',
            description: 'Radio 用于单选，groupValue 表示当前选中的值，onChanged 监听变化。',
            code: '''Radio(
  value: 0,
  groupValue: groupValue,
  onChanged: (val) {
    // 处理选中变化
  },
)''',
            demo: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<int>(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: (val) {
                    setState(() => _radioValue = val ?? 0);
                  },
                ),
                const Text('选项A'),
                Radio<int>(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (val) {
                    setState(() => _radioValue = val ?? 0);
                  },
                ),
                const Text('选项B'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _RadioSection(
            title: 'RadioListTile',
            description: 'RadioListTile 可带标题、子标题和图标，适合列表场景。',
            code: '''RadioListTile(
  value: 0,
  groupValue: groupValue,
  onChanged: (val) {
    // 处理选中变化
  },
  title: Text('选项A'),
  subtitle: Text('描述'),
  secondary: Icon(Icons.filter_1),
)''',
            demo: Column(
              children: [
                RadioListTile<int>(
                  value: 0,
                  groupValue: _radioListTileValue,
                  onChanged: (val) {
                    setState(() => _radioListTileValue = val ?? 0);
                  },
                  title: const Text('选项A'),
                  subtitle: const Text('描述'),
                  secondary: const Icon(Icons.filter_1),
                  selected: _radioListTileValue == 0,
                ),
                RadioListTile<int>(
                  value: 1,
                  groupValue: _radioListTileValue,
                  onChanged: (val) {
                    setState(() => _radioListTileValue = val ?? 0);
                  },
                  title: const Text('选项B'),
                  subtitle: const Text('描述'),
                  secondary: const Icon(Icons.filter_2),
                  selected: _radioListTileValue == 1,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _RadioSection(
            title: '自定义颜色',
            description: 'activeColor 属性可自定义选中时的颜色。',
            code: '''Radio(
  value: 0,
  groupValue: groupValue,
  onChanged: (val) {},
  activeColor: Colors.green,
)''',
            demo: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<int>(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: (val) {
                    setState(() => _radioValue = val ?? 0);
                  },
                  activeColor: Colors.green,
                ),
                const Text('绿色A'),
                Radio<int>(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (val) {
                    setState(() => _radioValue = val ?? 0);
                  },
                  activeColor: Colors.green,
                ),
                const Text('绿色B'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RadioSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _RadioSection({
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