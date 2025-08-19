import 'package:flutter/material.dart';

class PopupMenuButtonDemoPage extends StatefulWidget {
  const PopupMenuButtonDemoPage({super.key});

  @override
  State<PopupMenuButtonDemoPage> createState() => _PopupMenuButtonDemoPageState();
}

class _PopupMenuButtonDemoPageState extends State<PopupMenuButtonDemoPage> {
  String _selected = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PopupMenuButton 弹出菜单控件详解'), actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            setState(() => _selected = value);
          },
          itemBuilder: (context) => [
            const PopupMenuItem(value: '设置', child: Text('设置')),
            const PopupMenuItem(value: '帮助', child: Text('帮助')),
            const PopupMenuItem(value: '退出', child: Text('退出')),
          ],
        ),
      ]),
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
                  Text('PopupMenuButton 用于弹出菜单选择，常用于 AppBar、列表项等场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 PopupMenuButton 的基本用法、自定义菜单、最佳实践等。'),
                ],
              ),
            ),
          ),
          _PopupMenuSection(
            title: '基本用法',
            description: 'PopupMenuButton 可弹出菜单，onSelected 监听选中项。',
            code: '''PopupMenuButton<String>(
  onSelected: (value) {
    // 处理选中
  },
  itemBuilder: (context) => [
    PopupMenuItem(value: 'A', child: Text('A')),
    ...
  ],
)''',
            demo: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('当前选择: $_selected'),
                const SizedBox(width: 8),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    setState(() => _selected = value);
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'Home', child: Text('Home')),
                    const PopupMenuItem(value: 'Discover', child: Text('Discover')),
                    const PopupMenuItem(value: 'Community', child: Text('Community')),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _PopupMenuSection(
            title: '自定义菜单内容',
            description: 'itemBuilder 可返回任意 Widget，实现带图标、分组等自定义菜单。',
            code: '''PopupMenuButton<String>(
  itemBuilder: (context) => [
    PopupMenuItem(
      value: '设置',
      child: Row(children: [Icon(Icons.settings), Text('设置')]),
    ),
    ...
  ],
)''',
            demo: PopupMenuButton<String>(
              onSelected: (value) {
                setState(() => _selected = value);
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: '设置',
                  child: Row(children: const [Icon(Icons.settings), SizedBox(width: 8), Text('设置')]),
                ),
                PopupMenuItem(
                  value: '帮助',
                  child: Row(children: const [Icon(Icons.help), SizedBox(width: 8), Text('帮助')]),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  value: '退出',
                  child: Row(children: const [Icon(Icons.exit_to_app), SizedBox(width: 8), Text('退出')]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _PopupMenuSection(
            title: 'AppBar 菜单',
            description: 'PopupMenuButton 常用于 AppBar actions，作为全局菜单入口。',
            code: '''AppBar(
  actions: [
    PopupMenuButton(...),
  ],
)''',
            demo: const Text('本页右上角可体验 AppBar 菜单'),
          ),
          const SizedBox(height: 24),
          _PopupMenuSection(
            title: '最佳实践',
            description: '''1. 菜单项建议用 PopupMenuItem。
2. 可用 PopupMenuDivider 分组。
3. 建议菜单项简洁明了。
4. 可结合 IconButton 实现更多交互。''',
            code: '''PopupMenuButton<String>(
  icon: Icon(Icons.more_vert),
  ...
)''',
            demo: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                setState(() => _selected = value);
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'A', child: Text('A')),
                const PopupMenuItem(value: 'B', child: Text('B')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PopupMenuSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _PopupMenuSection({
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