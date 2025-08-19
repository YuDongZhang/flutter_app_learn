import 'package:flutter/material.dart';

class TabDemoPage extends StatefulWidget {
  const TabDemoPage({super.key});

  @override
  State<TabDemoPage> createState() => _TabDemoPageState();
}

class _TabDemoPageState extends State<TabDemoPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar 标签页控件详解'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '首页', icon: Icon(Icons.home)),
            Tab(text: '发现', icon: Icon(Icons.explore)),
            Tab(text: '我的', icon: Icon(Icons.person)),
          ],
        ),
      ),
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
                  Text('TabBar/TabBarView 用于实现顶部标签页切换，常用于多页面内容展示。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 TabBar、TabBarView、TabController、自定义 Tab、最佳实践等。'),
                ],
              ),
            ),
          ),
          _TabSection(
            title: '基本用法 TabBar + TabBarView',
            description: 'TabBar 和 TabBarView 结合 TabController 实现标签页切换。',
            code: '''DefaultTabController(
  length: 3,
  child: Scaffold(
    appBar: AppBar(
      bottom: TabBar(tabs: [...]),
    ),
    body: TabBarView(children: [...]),
  ),
)''',
            demo: SizedBox(
              height: 180,
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(text: 'A'),
                        Tab(text: 'B'),
                        Tab(text: 'C'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Center(child: Text('内容A')),
                          Center(child: Text('内容B')),
                          Center(child: Text('内容C')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _TabSection(
            title: '自定义 Tab',
            description: 'Tab 可自定义图标、文本、Widget。',
            code: '''TabBar(
  tabs: [
    Tab(icon: Icon(Icons.home), text: '首页'),
    ...
  ],
)''',
            demo: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(icon: Icon(Icons.home), text: '首页'),
                Tab(icon: Icon(Icons.explore), text: '发现'),
                Tab(icon: Icon(Icons.person), text: '我的'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _TabSection(
            title: 'TabController 控制',
            description: 'TabController 可手动控制标签页切换。',
            code: '''TabController(
  length: 3,
  vsync: this,
)''',
            demo: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _tabController.animateTo(0),
                  child: const Text('切到首页'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _tabController.animateTo(2),
                  child: const Text('切到我的'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _TabSection(
            title: '最佳实践',
            description: '''1. 推荐用 DefaultTabController 简化代码。
2. TabBar/TabBarView 必须配合 controller。
3. Tab 内容建议简洁明了。
4. 可结合 PageView 实现更复杂切换。''',
            code: '''DefaultTabController(
  length: 3,
  child: ...,
)''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.explore)),
            Tab(icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}

class _TabSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _TabSection({
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