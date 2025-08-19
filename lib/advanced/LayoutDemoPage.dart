import 'package:flutter/material.dart';

class LayoutDemoPage extends StatelessWidget {
  const LayoutDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('布局 Layout 控件详解')),
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
                  Text('Flutter 提供了丰富的布局控件，包括线性布局、约束布局、比例布局、层叠布局等，灵活应对各种 UI 场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 Row/Column、ConstrainedBox、AspectRatio、Stack/Positioned 等常用布局控件。'),
                ],
              ),
            ),
          ),
          _LayoutSection(
            title: '线性布局 Row/Column',
            description: 'Row/Column 实现水平/垂直线性排列，mainAxis/crossAxis 控制主轴/交叉轴对齐。',
            code: '''Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.star),
    Icon(Icons.star),
  ],
)''',
            demo: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Colors.orange, size: 32),
                SizedBox(width: 16),
                Icon(Icons.star, color: Colors.blue, size: 32),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _LayoutSection(
            title: '约束布局 ConstrainedBox',
            description: 'ConstrainedBox 可对子部件设置最大/最小宽高约束。',
            code: '''ConstrainedBox(
  constraints: BoxConstraints(
    minHeight: 100,
    maxWidth: 200,
  ),
  child: Container(color: Colors.blue),
)''',
            demo: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 100, maxWidth: 200),
              child: Container(color: Colors.blue, height: 50),
            ),
          ),
          const SizedBox(height: 24),
          _LayoutSection(
            title: '比例布局 AspectRatio',
            description: 'AspectRatio 可强制子部件按指定宽高比布局。',
            code: '''AspectRatio(
  aspectRatio: 16 / 9,
  child: Container(color: Colors.blue),
)''',
            demo: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(color: Colors.blue, height: 60),
            ),
          ),
          const SizedBox(height: 24),
          _LayoutSection(
            title: '层叠布局 Stack/Positioned',
            description: 'Stack 可实现子部件层叠，Positioned 精确定位。',
            code: '''Stack(
  children: [
    Container(color: Colors.blue, width: 120, height: 120),
    Positioned(
      right: 8, top: 8,
      child: Icon(Icons.star, color: Colors.white),
    ),
  ],
)''',
            demo: SizedBox(
              width: 160,
              height: 120,
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    color: Colors.blue,
                  ),
                  const Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(Icons.star, color: Colors.white, size: 32),
                  ),
                  const Positioned(
                    left: 8,
                    bottom: 8,
                    child: Icon(Icons.favorite, color: Colors.red, size: 28),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _LayoutSection(
            title: '最佳实践',
            description: '''1. 布局建议嵌套组合使用。
2. 尽量避免嵌套过深。
3. 善用 Expanded/Flexible 实现自适应。
4. 可用 MediaQuery 获取屏幕尺寸。''',
            code: '''Expanded(
  child: Container(color: Colors.blue),
)''',
            demo: Row(
              children: [
                Container(width: 60, height: 40, color: Colors.grey[300]),
                const Expanded(
                  child: SizedBox(height: 40, child: ColoredBox(color: Colors.blue)),
                ),
                Container(width: 40, height: 40, color: Colors.grey[300]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LayoutSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _LayoutSection({
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