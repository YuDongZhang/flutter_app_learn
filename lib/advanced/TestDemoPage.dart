import 'package:flutter/material.dart';

class TestDemoPage extends StatefulWidget {
  const TestDemoPage({super.key});

  @override
  State<TestDemoPage> createState() => _TestDemoPageState();
}

class _TestDemoPageState extends State<TestDemoPage> {
  int count = 0;

  get name => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test 测试控件详解')),
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
                  Text('测试控件用于演示 Widget 测试、交互、静态方法等。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 Widget 测试、ActionChip 交互、静态方法测试、最佳实践等。'),
                ],
              ),
            ),
          ),
          _TestSection(
            title: '基本 Widget 测试',
            description: '可通过 Widget 测试验证 UI 交互。',
            code: '''testWidgets('ActionChip 计数', (tester) async {
  await tester.pumpWidget(TestDemoPage());
  expect(find.text('0'), findsOneWidget);
  await tester.tap(find.byType(ActionChip));
  await tester.pump();
  expect(find.text('1'), findsOneWidget);
});''',
            demo: Row(
              children: [
                const Chip(label: Text('hello')),
                ActionChip(
                  key: const Key('actionChip'),
                  label: Text(
                    '$count',
                    key: const Key('actionChipLabelText'),
                  ),
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _TestSection(
            title: '静态方法测试',
            description: '可通过静态方法测试业务逻辑。',
            code: '''class NinghaoTestDemo {
  static greet(String name) {
    return 'hello $name';
  }
}

// 测试
expect(NinghaoTestDemo.greet('flutter'), 'hello flutter');''',
            demo: Text('NinghaoTestDemo.greet("flutter") = ${NinghaoTestDemo.greet("flutter")}'),
          ),
          const SizedBox(height: 24),
          _TestSection(
            title: '最佳实践',
            description: '''1. 建议用 testWidgets 进行 UI 测试。
2. 交互控件建议加 key。
3. 静态方法便于单元测试。
4. 可结合 mock、集成测试等。''',
            code: '''testWidgets('ActionChip 计数', (tester) async { ... });''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
    );
  }
}

class NinghaoTestDemo {
  static String greet(String name) => 'hello $name';
}

class _TestSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _TestSection({
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