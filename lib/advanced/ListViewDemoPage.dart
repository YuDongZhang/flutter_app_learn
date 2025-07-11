import 'package:flutter/material.dart';

class ListViewDemoPage extends StatelessWidget {
  const ListViewDemoPage({super.key});

  static final List<_DemoPost> _posts = [
    _DemoPost('Candy Shop', 'Mohamed', 'https://resources.ninghao.net/images/candy-shop.jpg'),
    _DemoPost('Dragon', 'Chahin', 'https://resources.ninghao.net/images/dragon.jpg'),
    _DemoPost('Icecream Truck', 'Mohamed', 'https://resources.ninghao.net/images/icecream-truck.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView 列表控件详解')),
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
                  Text('ListView 是最常用的滚动列表控件，支持静态/动态列表、分隔、复杂自定义等。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 ListView 的基本用法、builder 动态构建、自定义 item、最佳实践等。'),
                ],
              ),
            ),
          ),
          _ListViewSection(
            title: '基本用法',
            description: 'ListView 可直接传入 children 实现静态列表。',
            code: '''ListView(
  children: [
    ListTile(title: Text('A')),
    ListTile(title: Text('B')),
  ],
)''',
            demo: SizedBox(
              height: 120,
              child: ListView(
                children: const [
                  ListTile(title: Text('静态项A')),
                  ListTile(title: Text('静态项B')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _ListViewSection(
            title: '动态构建 ListView.builder',
            description: 'ListView.builder 适合大数据量或动态列表，按需构建 item。',
            code: '''ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ...,
)''',
            demo: SizedBox(
              height: 180,
              child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  return ListTile(
                    leading: Image.network(post.imageUrl, width: 40, height: 40, fit: BoxFit.cover),
                    title: Text(post.title),
                    subtitle: Text(post.author),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          _ListViewSection(
            title: '自定义 item',
            description: 'itemBuilder 可返回任意 Widget，实现复杂自定义。',
            code: '''itemBuilder: (context, index) {
  return Card(
    child: ListTile(...),
  );
}''',
            demo: SizedBox(
              height: 220,
              child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(post.imageUrl, width: 56, height: 56, fit: BoxFit.cover),
                      title: Text(post.title),
                      subtitle: Text(post.author),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('点击了：${post.title}')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          _ListViewSection(
            title: '最佳实践',
            description: '''1. builder 适合大数据量列表。
2. 可用 separatorBuilder 添加分隔线。
3. 建议 item 尽量简洁。
4. 可结合 SliverList 实现复杂滚动。''',
            code: '''ListView.separated(
  itemBuilder: ...,
  separatorBuilder: ...,
  itemCount: ...,
)''',
            demo: SizedBox(
              height: 120,
              child: ListView.separated(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  return ListTile(
                    leading: Image.network(post.imageUrl, width: 40, height: 40, fit: BoxFit.cover),
                    title: Text(post.title),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoPost {
  final String title;
  final String author;
  final String imageUrl;
  _DemoPost(this.title, this.author, this.imageUrl);
}

class _ListViewSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _ListViewSection({
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