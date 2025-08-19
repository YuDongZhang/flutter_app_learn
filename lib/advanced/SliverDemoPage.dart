import 'package:flutter/material.dart';

class SliverDemoPage extends StatelessWidget {
  const SliverDemoPage({super.key});

  static final List<_DemoPost> _posts = [
    _DemoPost('Candy Shop', 'Mohamed', 'https://resources.ninghao.net/images/candy-shop.jpg'),
    _DemoPost('Dragon', 'Chahin', 'https://resources.ninghao.net/images/dragon.jpg'),
    _DemoPost('Icecream Truck', 'Mohamed', 'https://resources.ninghao.net/images/icecream-truck.jpg'),
    _DemoPost('Space Skull', 'Mohamed', 'https://resources.ninghao.net/images/space-skull.jpg'),
    _DemoPost('Overkill', 'Mohamed', 'https://resources.ninghao.net/images/overkill.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sliver 高级滚动控件详解')),
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
                  Text('Sliver 是 Flutter 高级滚动布局的核心，支持自定义滚动效果、吸顶、网格、列表等。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 SliverAppBar、SliverList、SliverGrid、CustomScrollView 等用法。'),
                ],
              ),
            ),
          ),
          _SliverSection(
            title: 'SliverAppBar 吸顶头部',
            description: 'SliverAppBar 可实现吸顶、伸缩、背景图等效果，常用于滚动页面顶部。',
            code: '''SliverAppBar(
  title: Text('标题'),
  floating: true,
  expandedHeight: 180,
  flexibleSpace: FlexibleSpaceBar(
    title: Text('内容'),
    background: Image.network('...'),
  ),
)''',
            demo: SizedBox(
              height: 220,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: const Text('SliverAppBar'),
                    floating: true,
                    expandedHeight: 120,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text('FlexibleSpaceBar'),
                      background: Image.network(
                        'https://resources.ninghao.net/images/overkill.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(height: 60, color: Colors.grey[200], alignment: Alignment.center, child: const Text('内容区')), 
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _SliverSection(
            title: 'SliverList 列表',
            description: 'SliverList 可高效渲染大数据量列表，配合 CustomScrollView 使用。',
            code: '''SliverList(
  delegate: SliverChildBuilderDelegate(
    (context, index) => ...,
    childCount: ...,
  ),
)''',
            demo: SizedBox(
              height: 200,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final post = _posts[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: Image.network(post.imageUrl, width: 56, height: 56, fit: BoxFit.cover),
                            title: Text(post.title),
                            subtitle: Text(post.author),
                          ),
                        );
                      },
                      childCount: _posts.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _SliverSection(
            title: 'SliverGrid 网格',
            description: 'SliverGrid 可实现网格布局，支持自定义列数、间距、比例。',
            code: '''SliverGrid(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
  ),
  delegate: SliverChildBuilderDelegate(...),
)''',
            demo: SizedBox(
              height: 200,
              child: CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final post = _posts[index];
                        return Card(
                          child: Image.network(post.imageUrl, fit: BoxFit.cover),
                        );
                      },
                      childCount: _posts.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _SliverSection(
            title: 'CustomScrollView 组合',
            description: 'CustomScrollView 可组合多个 Sliver，实现复杂滚动布局。',
            code: '''CustomScrollView(
  slivers: [
    SliverAppBar(...),
    SliverList(...),
    SliverGrid(...),
  ],
)''',
            demo: SizedBox(
              height: 220,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: const Text('SliverAppBar'),
                    floating: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => ListTile(title: Text('Item $index')),
                      childCount: 3,
                    ),
                  ),
                  SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(color: Colors.blue[100 * (index % 9)], height: 60),
                      childCount: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _SliverSection(
            title: '最佳实践',
            description: '''1. 适合大数据量滚动场景。
2. 可组合多种 Sliver 实现复杂布局。
3. 建议配合 CustomScrollView 使用。
4. 善用 SliverPadding/SliverSafeArea。''',
            code: '''SliverPadding(
  padding: EdgeInsets.all(8),
  sliver: SliverList(...),
)''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
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

class _SliverSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _SliverSection({
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