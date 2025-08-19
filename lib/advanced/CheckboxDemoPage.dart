import 'package:flutter/material.dart';

class CheckboxDemoPage extends StatefulWidget {
  const CheckboxDemoPage({super.key});

  @override
  State<CheckboxDemoPage> createState() => _CheckboxDemoPageState();
}

class _CheckboxDemoPageState extends State<CheckboxDemoPage> {
  bool _checked = false;
  bool _checkedListTile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox 复选框控件详解')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _CheckboxSection(
            title: '基本用法',
            description: 'Checkbox 用于二元选择（选中/未选中），常用于表单、设置项等。',
            code: '''Checkbox(
  value: checked,
  onChanged: (value) {
    // 处理选中状态变化
  },
)''',
            demo: Checkbox(
              value: _checked,
              onChanged: (value) {
                setState(() => _checked = value ?? false);
              },
            ),
          ),
          const SizedBox(height: 24),
          _CheckboxSection(
            title: 'CheckboxListTile',
            description: 'CheckboxListTile 可带标题、子标题和图标，常用于列表场景。',
            code: '''CheckboxListTile(
  value: checked,
  onChanged: (value) {
    // 处理选中状态变化
  },
  title: Text('同意协议'),
  subtitle: Text('请阅读并同意'),
  secondary: Icon(Icons.info),
)''',
            demo: CheckboxListTile(
              value: _checkedListTile,
              onChanged: (value) {
                setState(() => _checkedListTile = value ?? false);
              },
              title: const Text('同意协议'),
              subtitle: const Text('请阅读并同意'),
              secondary: const Icon(Icons.info),
            ),
          ),
          const SizedBox(height: 24),
          _CheckboxSection(
            title: '自定义颜色和形状',
            description: 'activeColor、checkColor、shape 属性可自定义 Checkbox 外观。',
            code: '''Checkbox(
  value: checked,
  onChanged: (value) {},
  activeColor: Colors.green,
  checkColor: Colors.white,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
)''',
            demo: Checkbox(
              value: _checked,
              onChanged: (value) {
                setState(() => _checked = value ?? false);
              },
              activeColor: Colors.green,
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckboxSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _CheckboxSection({
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