import 'package:flutter/material.dart';
import '../20-宁浩教程练习/model/post.dart';

class PostShowDemoPage extends StatelessWidget {
  const PostShowDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Post samplePost = posts.first;
    return Scaffold(
      appBar: AppBar(title: const Text('PostShow 卡片详情页详解')),
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
                  Text('PostShow 用于展示单个 Post（如文章、图片、卡片等）的详细信息页面。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 PostShow 的基本用法、数据传递、UI结构、最佳实践等。'),
                ],
              ),
            ),
          ),
          _PostShowSection(
            title: '基本用法',
            description: 'PostShow 通过构造函数接收 Post 对象，展示其图片、标题、作者和描述。',
            code: '''class PostShow extends StatelessWidget {
  final Post post;
  PostShow({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: ...
    );
  }
}''',
            demo: SizedBox(
              height: 400,
              child: PostShow(post: samplePost),
            ),
          ),
          const SizedBox(height: 24),
          _PostShowSection(
            title: '数据模型与传递',
            description: 'PostShow 依赖 Post 数据模型，通常通过路由参数或构造函数传递。',
            code: '''class Post {
  final String title;
  final String author;
  final String imageUrl;
  final String description;
  Post({this.title, this.author, this.imageUrl, this.description});
}

// 跳转时传递
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => PostShow(post: post),
  ),
);''',
            demo: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostShow(post: samplePost),
                  ),
                );
              },
              child: const Text('跳转到 PostShow 详情页'),
            ),
          ),
          const SizedBox(height: 24),
          _PostShowSection(
            title: 'UI 结构与自定义',
            description: 'PostShow 可自定义展示内容，如图片、标题、作者、描述等，支持主题样式。',
            code: '''body: Column(
  children: [
    Image.network(post.imageUrl),
    Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title, style: Theme.of(context).textTheme.title),
          Text(post.author, style: Theme.of(context).textTheme.subhead),
          SizedBox(height: 32),
          Text(post.description, style: Theme.of(context).textTheme.body1),
        ],
      ),
    ),
  ],
)''',
            demo: Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: PostShow(post: samplePost),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _PostShowSection(
            title: '最佳实践',
            description: '''1. 推荐通过构造函数传递数据，保持组件解耦。
2. 图片加载可加占位符或错误处理。
3. 支持主题自定义，适配不同风格。
4. 可扩展为支持更多字段或交互。''',
            code: '''PostShow(post: post)''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
    );
  }
}

class _PostShowSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _PostShowSection({
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

// 引用原有 PostShow 组件
class PostShow extends StatelessWidget {
  final Post post;
  const PostShow({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            post.imageUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 180,
              color: Colors.grey[300],
              child: const Center(child: Icon(Icons.broken_image, size: 48)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 4),
              Text(post.author, style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 12),
              Text(post.description, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
} 