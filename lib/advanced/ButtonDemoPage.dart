import 'package:flutter/material.dart';

class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button 按钮控件详解')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ButtonSection(
            title: 'ElevatedButton（主要按钮）',
            description: 'ElevatedButton 是 Flutter 推荐的主要按钮，具有立体效果，适合强调操作。',
            code: '''ElevatedButton(
  onPressed: () {
    // 按钮点击事件
  },
  child: Text('ElevatedButton'),
)''',
            demo: ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),
          ),
          const SizedBox(height: 24),
          _ButtonSection(
            title: 'TextButton（文本按钮）',
            description: 'TextButton 是无背景的扁平按钮，适合工具栏、对话框等场景。',
            code: '''TextButton(
  onPressed: () {
    // 按钮点击事件
  },
  child: Text('TextButton'),
)''',
            demo: TextButton(
              onPressed: () {},
              child: const Text('TextButton'),
            ),
          ),
          const SizedBox(height: 24),
          _ButtonSection(
            title: 'OutlinedButton（描边按钮）',
            description: 'OutlinedButton 带有边框，适合次要操作或强调对比。',
            code: '''OutlinedButton(
  onPressed: () {
    // 按钮点击事件
  },
  child: Text('OutlinedButton'),
)''',
            demo: OutlinedButton(
              onPressed: () {},
              child: const Text('OutlinedButton'),
            ),
          ),
          const SizedBox(height: 24),
          _ButtonSection(
            title: '带图标的按钮',
            description: '三种按钮都支持 icon 版本，可通过 Icon+Text 组合实现。',
            code: '''ElevatedButton.icon(
  onPressed: () {},
  icon: Icon(Icons.thumb_up),
  label: Text('点赞'),
)
TextButton.icon(
  onPressed: () {},
  icon: Icon(Icons.info),
  label: Text('详情'),
)
OutlinedButton.icon(
  onPressed: () {},
  icon: Icon(Icons.send),
  label: Text('发送'),
)''',
            demo: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                  label: const Text('点赞'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.info),
                  label: const Text('详情'),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                  label: const Text('发送'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _ButtonSection(
            title: '按钮样式自定义',
            description: '可通过 style 属性自定义按钮颜色、形状、大小等。',
            code: '''ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: Colors.green, // 背景色
    onPrimary: Colors.white, // 文字颜色
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  ),
  onPressed: () {},
  child: Text('自定义样式'),
)''',
            demo: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: () {},
              child: const Text('自定义样式'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _ButtonSection({
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