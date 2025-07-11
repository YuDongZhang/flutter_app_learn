import 'package:flutter/material.dart';

class SwitchDemoPage extends StatefulWidget {
  const SwitchDemoPage({super.key});

  @override
  State<SwitchDemoPage> createState() => _SwitchDemoPageState();
}

class _SwitchDemoPageState extends State<SwitchDemoPage> {
  bool _switchValue = false;
  bool _switchListTileValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch 开关控件详解')),
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
                  Text('Switch（开关）用于二元状态的切换，如开/关、启用/禁用。常用于设置项、表单等场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 Switch 的基本用法、SwitchListTile 组合用法，以及如何自定义外观。'),
                ],
              ),
            ),
          ),
          _SwitchSection(
            title: '基本用法',
            description: 'Switch 用于二元状态切换，onChanged 回调用于监听状态变化。',
            code: '''Switch(
  value: value,
  onChanged: (val) {
    // 处理状态变化
  },
)''',
            demo: Switch(
              value: _switchValue,
              onChanged: (val) {
                setState(() => _switchValue = val);
              },
            ),
          ),
          const SizedBox(height: 24),
          _SwitchSection(
            title: 'SwitchListTile',
            description: 'SwitchListTile 可带标题、子标题和图标，适合列表场景。',
            code: '''SwitchListTile(
  value: value,
  onChanged: (val) {
    // 处理状态变化
  },
  title: Text('启用功能'),
  subtitle: Text('描述'),
  secondary: Icon(Icons.lightbulb),
)''',
            demo: SwitchListTile(
              value: _switchListTileValue,
              onChanged: (val) {
                setState(() => _switchListTileValue = val);
              },
              title: const Text('启用功能'),
              subtitle: const Text('描述'),
              secondary: Icon(_switchListTileValue ? Icons.lightbulb : Icons.lightbulb_outline),
              selected: _switchListTileValue,
            ),
          ),
          const SizedBox(height: 24),
          _SwitchSection(
            title: '自定义颜色和外观',
            description: 'activeColor、inactiveThumbColor、inactiveTrackColor 可自定义 Switch 颜色。',
            code: '''Switch(
  value: value,
  onChanged: (val) {},
  activeColor: Colors.green,
  inactiveThumbColor: Colors.grey,
  inactiveTrackColor: Colors.grey[300],
)''',
            demo: Switch(
              value: _switchValue,
              onChanged: (val) {
                setState(() => _switchValue = val);
              },
              activeColor: Colors.green,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}

class _SwitchSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _SwitchSection({
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