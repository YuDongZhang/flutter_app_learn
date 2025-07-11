import 'package:flutter/material.dart';

class BasicWidgetDemoPage extends StatelessWidget {
  const BasicWidgetDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('基础控件详解')),
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
                  Text('本页系统讲解 Flutter 常用基础控件，包括 Container、Text、Icon、Image、Row、Column、Stack、Padding、Align 等。'),
                  SizedBox(height: 8),
                  Text('每个控件包含用途、常用属性、代码示例和交互演示，助你打好 Flutter UI 基础。'),
                ],
              ),
            ),
          ),
          _BasicSection(
            title: 'Container 容器',
            description: '最常用的布局容器，可设置尺寸、边距、颜色、装饰等。',
            code: '''Container(
  width: 120,
  height: 60,
  color: Colors.blue,
  alignment: Alignment.center,
  child: Text('Container'),
)''',
            demo: Container(
              width: 120,
              height: 60,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text('Container', style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 24),
          _BasicSection(
            title: 'Text 文本',
            description: '显示单行或多行文本，可自定义样式、对齐、溢出等。',
            code: '''Text(
  'Hello Flutter',
  style: TextStyle(fontSize: 20, color: Colors.deepPurple),
  textAlign: TextAlign.center,
)''',
            demo: const Text('Hello Flutter', style: TextStyle(fontSize: 20, color: Colors.deepPurple), textAlign: TextAlign.center),
          ),
          const SizedBox(height: 24),
          _BasicSection(
            title: 'Icon 图标',
            description: '内置丰富的矢量图标，可自定义大小、颜色。',
            code: '''Icon(
  Icons.favorite,
  color: Colors.red,
  size: 32,
)''',
            demo: const Icon(Icons.favorite, color: Colors.red, size: 32),
          ),
          const SizedBox(height: 24),
          _BasicSection(
            title: 'Image 图片',
            description: '支持网络、本地、资源图片，常用属性有 fit、width、height、colorBlendMode 等。',
            code: '''Image.network(
  'https://flutter.dev/images/flutter-logo-sharing.png',
  width: 100,
  height: 60,
  fit: BoxFit.cover,
)''',
            demo: Image.network(
              'https://flutter.dev/images/flutter-logo-sharing.png',
              width: 100,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          _BasicSection(
            title: 'Row 横向布局',
            description: '水平排列子控件，可设置主轴/交叉轴对齐方式。',
            code: '''Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.star),
    SizedBox(width: 8),
    Text('Row'),
  ],
)''',
            demo: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star),
                SizedBox(width: 8),
                Text('Row'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _BasicSection(
            title: 'Column 纵向布局',
            description: '垂直排列子控件，可设置主轴/交叉轴对齐方式。',
            code: '''Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.star),
    SizedBox(height: 8),
    Text('Column'),
  ],
)''',
            demo: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.star),
                SizedBox(height: 8),
                Text('Column'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _BasicSection(
            title: 'Stack 叠层布局',
            description: '可将多个子控件层叠显示，常用于定位、装饰等场景。',
            code: '''Stack(
  alignment: Alignment.center,
  children: [
    Container(width: 80, height: 80, color: Colors.blue),
    Icon(Icons.star, color: Colors.white, size: 40),
  ],
)''',
            demo: Stack(
              alignment: Alignment.center,
              children: const [
                SizedBox(width: 80, height: 80, child: DecoratedBox(decoration: BoxDecoration(color: Colors.blue))),
                Icon(Icons.star, color: Colors.white, size: 40),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _BasicSection(
            title: 'Padding 内边距',
            description: '为子控件添加内边距，常用于布局美化。',
            code: '''Padding(
  padding: EdgeInsets.all(16),
  child: Text('Padding'),
)''',
            demo: const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Padding'),
            ),
          ),
          const SizedBox(height: 24),
          _BasicSection(
            title: 'Align 对齐',
            description: '对子控件进行对齐定位。',
            code: '''Align(
  alignment: Alignment.bottomRight,
  child: Icon(Icons.send),
)''',
            demo: const SizedBox(
              height: 60,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Icon(Icons.send),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _BasicSection(
            title: '最佳实践',
            description: '''1. 基础控件是所有 Flutter UI 的基石。
2. 推荐多练习组合、嵌套、属性调优。
3. 善用文档和官方示例。''',
            code: '''Container(...)
Text(...)
Icon(...)
// 组合使用''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
    );
  }
}

class _BasicSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _BasicSection({
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