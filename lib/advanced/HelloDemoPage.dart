import 'package:flutter/material.dart';

class HelloDemoPage extends StatelessWidget {
  const HelloDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello Demo 详解')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.blue[50],
            margin: const EdgeInsets.only(bottom: 24),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('学习导引', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Hello Demo 展示了自定义 StatelessWidget、Text 基础用法，是 Flutter 入门的第一步。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 StatelessWidget、Text、样式、对齐、最佳实践等。'),
                ],
              ),
            ),
          ),
          _HelloSection(
            title: '自定义 StatelessWidget',
            description: 'StatelessWidget 适合展示静态内容，需重写 build 方法。',
            code: '''class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('hello'),
    );
  }
}''',
            demo: const Hello(),
          ),
          const SizedBox(height: 24),
          _HelloSection(
            title: 'Text 基础用法',
            description: 'Text 用于显示文本，可设置样式、对齐、最大行数、溢出等。',
            code: '''Text(
  'Hello Flutter',
  style: TextStyle(fontSize: 32, color: Colors.blue),
  textAlign: TextAlign.center,
)''',
            demo: const Text('Hello Flutter', style: TextStyle(fontSize: 32, color: Colors.blue), textAlign: TextAlign.center),
          ),
          const SizedBox(height: 24),
          _HelloSection(
            title: '样式与对齐',
            description: 'Text 支持字体、颜色、粗细、斜体、对齐、阴影等丰富样式。',
            code: '''Text(
  '样式演示',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: Colors.deepOrange,
    shadows: [Shadow(color: Colors.grey, offset: Offset(2,2), blurRadius: 2)],
  ),
  textAlign: TextAlign.right,
)''',
            demo: const Text(
              '样式演示',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.deepOrange,
                shadows: [Shadow(color: Colors.grey, offset: Offset(2,2), blurRadius: 2)],
              ),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(height: 24),
          _HelloSection(
            title: '最佳实践',
            description: '''1. 推荐自定义 Widget 复用 UI。
2. Text 支持多样式、国际化。
3. 善用样式和对齐提升界面美观。
4. 组件命名规范、结构清晰。''',
            code: '''class Hello extends StatelessWidget {...}
Text('hello', ...)
''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
    );
  }
}

class _HelloSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _HelloSection({
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

class Hello extends StatelessWidget {
  const Hello({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hello',
        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.yellow),
        textDirection: TextDirection.rtl,
      ),
    );
  }
} 