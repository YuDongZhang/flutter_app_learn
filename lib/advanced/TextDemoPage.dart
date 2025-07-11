import 'package:flutter/material.dart';

class TextDemoPage extends StatelessWidget {
  const TextDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text 文本控件详解')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _TextSection(
            title: '基本用法',
            description: 'Text 用于显示一段文本，支持多种样式和对齐方式。',
            code: '''Text('Hello Flutter')''',
            demo: const Text('Hello Flutter'),
          ),
          const SizedBox(height: 24),
          _TextSection(
            title: '样式自定义',
            description: '可通过 style 属性自定义字体、颜色、大小、粗细等。',
            code: '''Text(
  '自定义样式',
  style: TextStyle(
    fontSize: 24,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    decoration: TextDecoration.underline,
  ),
)''',
            demo: const Text(
              '自定义样式',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 24),
          _TextSection(
            title: '文本对齐',
            description: 'textAlign 属性可设置文本的对齐方式。',
            code: '''Text(
  '居中对齐',
  textAlign: TextAlign.center,
)''',
            demo: const SizedBox(
              width: double.infinity,
              child: Text(
                '居中对齐',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 24),
          _TextSection(
            title: '文本溢出与最大行数',
            description: 'overflow 和 maxLines 属性可控制文本溢出显示省略号等。',
            code: '''Text(
  '这是一段很长很长很长很长很长很长的文本',
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
)''',
            demo: const Text(
              '这是一段很长很长很长很长很长很长的文本',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 24),
          _TextSection(
            title: '富文本 RichText',
            description: 'RichText 可实现多样式混排，需配合 TextSpan 使用。',
            code: '''RichText(
  text: TextSpan(
    text: 'Hello ',
    style: TextStyle(color: Colors.black, fontSize: 18),
    children: [
      TextSpan(text: 'Flutter', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
      TextSpan(text: ' !', style: TextStyle(color: Colors.red)),
    ],
  ),
)''',
            demo: RichText(
              text: TextSpan(
                text: 'Hello ',
                style: const TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  TextSpan(text: 'Flutter', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  TextSpan(text: ' !', style: const TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _TextSection({
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