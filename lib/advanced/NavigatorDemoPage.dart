import 'package:flutter/material.dart';

class NavigatorDemoPage extends StatelessWidget {
  const NavigatorDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigator 导航控件详解')),
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
                  Text('Navigator 是 Flutter 路由与页面导航的核心，支持 push、pop、命名路由、参数传递等。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 Navigator 的基本用法、命名路由、参数传递、最佳实践等。'),
                ],
              ),
            ),
          ),
          _NavigatorSection(
            title: '基本用法 Navigator.push',
            description: 'Navigator.push 可跳转到新页面，返回 Future 可获取返回值。',
            code: '''Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NewPage()),
);''',
            demo: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _DemoPage(title: '新页面'),
                  ),
                );
              },
              child: const Text('跳转到新页面'),
            ),
          ),
          const SizedBox(height: 24),
          _NavigatorSection(
            title: '命名路由 pushNamed',
            description: '可在 MaterialApp routes 配置路由表，pushNamed 跳转。',
            code: '''Navigator.pushNamed(context, '/about');''',
            demo: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const _DemoPage(title: 'About'),
                  ),
                );
              },
              child: const Text('跳转到 About 页面'),
            ),
          ),
          const SizedBox(height: 24),
          _NavigatorSection(
            title: '返回上一页 Navigator.pop',
            description: 'Navigator.pop 可返回上一页，并可传递返回值。',
            code: '''Navigator.pop(context, result);''',
            demo: ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _DemoPage(title: '可返回的页面'),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('返回值: $result')),
                );
              },
              child: const Text('跳转并获取返回值'),
            ),
          ),
          const SizedBox(height: 24),
          _NavigatorSection(
            title: '参数传递',
            description: '可通过构造函数或 settings.arguments 传递参数。',
            code: '''Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => NewPage(data: '参数'),
  ),
);''',
            demo: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const _DemoPage(title: '带参数页面', data: 'Hello!'),
                  ),
                );
              },
              child: const Text('跳转并传递参数'),
            ),
          ),
          const SizedBox(height: 24),
          _NavigatorSection(
            title: '最佳实践',
            description: '''1. 推荐使用命名路由统一管理页面。
2. 参数建议用构造函数传递。
3. 可用 pop 返回数据。
4. 路由表建议集中配置。''',
            code: '''MaterialApp(
  routes: {
    '/': (context) => HomePage(),
    '/about': (context) => AboutPage(),
  },
)''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
    );
  }
}

class _DemoPage extends StatelessWidget {
  final String title;
  final String? data;
  const _DemoPage({required this.title, this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('页面: $title', style: const TextStyle(fontSize: 20)),
            if (data != null) Text('参数: $data'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, '已返回'),
              child: const Text('返回并传值'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigatorSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _NavigatorSection({
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