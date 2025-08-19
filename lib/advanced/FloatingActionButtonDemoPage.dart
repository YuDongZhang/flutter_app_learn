import 'package:flutter/material.dart';

class FloatingActionButtonDemoPage extends StatefulWidget {
  const FloatingActionButtonDemoPage({super.key});

  @override
  State<FloatingActionButtonDemoPage> createState() => _FloatingActionButtonDemoPageState();
}

class _FloatingActionButtonDemoPageState extends State<FloatingActionButtonDemoPage> {
  int _counter = 0;
  bool _useExtended = false;
  FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.endFloat;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FloatingActionButton 浮动按钮控件详解')),
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
                  Text('FloatingActionButton（浮动按钮）常用于页面主操作，如新增、编辑等。支持自定义形状、位置、扩展样式。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 FAB 的基本用法、扩展用法、自定义外观与位置、最佳实践等。'),
                ],
              ),
            ),
          ),
          _FabSection(
            title: '基本用法',
            description: 'FloatingActionButton 常用于页面右下角，onPressed 处理点击事件。',
            code: '''FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
)''',
            demo: Column(
              children: [
                const Text('点击按钮计数：'),
                Text('$_counter', style: const TextStyle(fontSize: 32)),
                const SizedBox(height: 8),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add),
                  tooltip: '增加',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _FabSection(
            title: '扩展按钮 FloatingActionButton.extended',
            description: '带文字和图标的扩展按钮，适合强调主操作。',
            code: '''FloatingActionButton.extended(
  onPressed: () {},
  icon: Icon(Icons.add),
  label: Text('新增'),
)''',
            demo: FloatingActionButton.extended(
              onPressed: _incrementCounter,
              icon: const Icon(Icons.add),
              label: const Text('新增'),
            ),
          ),
          const SizedBox(height: 24),
          _FabSection(
            title: '自定义位置与形状',
            description: '通过 floatingActionButtonLocation、shape 属性自定义 FAB 位置和外观。',
            code: '''Scaffold(
  floatingActionButton: FloatingActionButton(...),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
)''',
            demo: Column(
              children: [
                DropdownButton<FloatingActionButtonLocation>(
                  value: _fabLocation,
                  items: const [
                    DropdownMenuItem(
                      value: FloatingActionButtonLocation.endFloat,
                      child: Text('右下角'),
                    ),
                    DropdownMenuItem(
                      value: FloatingActionButtonLocation.centerDocked,
                      child: Text('底部中间'),
                    ),
                  ],
                  onChanged: (loc) {
                    if (loc != null) setState(() => _fabLocation = loc);
                  },
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.star),
                  backgroundColor: Colors.purple,
                  shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _FabSection(
            title: '最佳实践',
            description: '''1. 建议仅用于主操作。
2. 避免页面堆叠多个 FAB。
3. 可结合 BottomAppBar 实现底部工具栏缺口。
4. 可用 tooltip 提示功能。''',
            code: '''// 带缺口的底部工具栏
Scaffold(
  floatingActionButton: FloatingActionButton(...),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  bottomNavigationBar: BottomAppBar(
    shape: CircularNotchedRectangle(),
    child: ...,
  ),
)''',
            demo: Scaffold(
              appBar: AppBar(title: const Text('FAB + BottomAppBar')), // 内嵌演示
              floatingActionButton: FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Icon(Icons.add),
                tooltip: '增加',
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                child: Container(height: 50),
              ),
              body: const Center(child: Text('底部工具栏与 FAB 缺口演示')),
            ),
          ),
        ],
      ),
      floatingActionButton: _useExtended
          ? FloatingActionButton.extended(
              onPressed: _incrementCounter,
              icon: const Icon(Icons.add),
              label: const Text('新增'),
            )
          : FloatingActionButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
      floatingActionButtonLocation: _fabLocation,
    );
  }
}

class _FabSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _FabSection({
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