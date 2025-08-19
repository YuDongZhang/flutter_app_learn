import 'package:flutter/material.dart';

class CardDemoPage extends StatelessWidget {
  const CardDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card 卡片控件详解')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _CardSection(
            title: '基本用法',
            description: 'Card 是一个带圆角和阴影的 Material 设计卡片容器，常用于信息展示、分组等场景。',
            code: '''Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('这是一个卡片'),
  ),
)''',
            demo: const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('这是一个卡片'),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _CardSection(
            title: '自定义外观',
            description: '可通过 shape、color、elevation 等属性自定义卡片的外观。',
            code: '''Card(
  color: Colors.amber[100],
  elevation: 8,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  child: ListTile(
    leading: Icon(Icons.info),
    title: Text('自定义卡片'),
    subtitle: Text('带圆角和阴影'),
  ),
)''',
            demo: Card(
              color: Colors.amber[100],
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const ListTile(
                leading: Icon(Icons.info),
                title: Text('自定义卡片'),
                subtitle: Text('带圆角和阴影'),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _CardSection(
            title: '卡片列表',
            description: 'Card 常与 ListView 结合，批量展示信息。',
            code: '''ListView(
  children: [
    Card(child: ListTile(title: Text('卡片1'))),
    Card(child: ListTile(title: Text('卡片2'))),
  ],
)''',
            demo: SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SizedBox(
                    width: 160,
                    child: Card(child: Center(child: Text('卡片1'))),
                  ),
                  SizedBox(
                    width: 160,
                    child: Card(child: Center(child: Text('卡片2'))),
                  ),
                  SizedBox(
                    width: 160,
                    child: Card(child: Center(child: Text('卡片3'))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _CardSection({
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