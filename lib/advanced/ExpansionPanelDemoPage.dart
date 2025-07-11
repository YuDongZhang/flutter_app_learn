import 'package:flutter/material.dart';

class ExpansionPanelDemoPage extends StatefulWidget {
  const ExpansionPanelDemoPage({super.key});

  @override
  State<ExpansionPanelDemoPage> createState() => _ExpansionPanelDemoPageState();
}

class _ExpansionPanelDemoPageState extends State<ExpansionPanelDemoPage> {
  final List<_PanelItem> _items = [
    _PanelItem('面板A', '这是面板A的内容'),
    _PanelItem('面板B', '这是面板B的内容'),
    _PanelItem('面板C', '这是面板C的内容'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ExpansionPanel 展开面板控件详解')),
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
                  Text('ExpansionPanel（展开面板）用于分组展示内容，支持折叠/展开，常用于FAQ、设置、分组列表等场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 ExpansionPanelList 的基本用法、自定义内容、最佳实践等。'),
                ],
              ),
            ),
          ),
          _ExpansionPanelSection(
            title: '基本用法',
            description: 'ExpansionPanelList 可管理多个可展开/收起的面板。',
            code: '''ExpansionPanelList(
  expansionCallback: (index, isExpanded) {
    // 切换展开/收起
  },
  children: [
    ExpansionPanel(
      headerBuilder: (context, isExpanded) => ...,
      body: ...,
      isExpanded: ...,
    ),
  ],
)''',
            demo: ExpansionPanelList(
              expansionCallback: (index, isExpanded) {
                setState(() => _items[index].isExpanded = !isExpanded);
              },
              children: _items.map((item) {
                return ExpansionPanel(
                  isExpanded: item.isExpanded,
                  headerBuilder: (context, isExpanded) => ListTile(
                    title: Text(item.header),
                  ),
                  body: ListTile(
                    title: Text(item.body),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          _ExpansionPanelSection(
            title: '自定义内容',
            description: '面板内容可自定义为任意 Widget，如表单、图片、列表等。',
            code: '''ExpansionPanel(
  body: Column(
    children: [
      Text('内容'),
      Image.network('...'),
    ],
  ),
)''',
            demo: ExpansionPanelList(
              expansionCallback: (index, isExpanded) {
                setState(() => _items[index].isExpanded = !isExpanded);
              },
              children: _items.map((item) {
                return ExpansionPanel(
                  isExpanded: item.isExpanded,
                  headerBuilder: (context, isExpanded) => ListTile(
                    title: Text(item.header),
                  ),
                  body: Column(
                    children: [
                      ListTile(title: Text(item.body)),
                      if (item.header == '面板A')
                        Image.network('https://resources.ninghao.net/images/candy-shop.jpg', height: 80),
                      if (item.header == '面板B')
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(decoration: InputDecoration(labelText: '输入内容')), 
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          _ExpansionPanelSection(
            title: '最佳实践',
            description: '''1. 建议配合 ListView 使用。
2. 面板内容建议简洁明了。
3. 可结合状态管理实现复杂交互。
4. 支持单开/多开模式。''',
            code: '''// 单开模式示例
ExpansionPanelList.radio(
  children: [
    ExpansionPanelRadio(
      value: 'A',
      headerBuilder: ...,
      body: ...,
    ),
  ],
)''',
            demo: ExpansionPanelList.radio(
              children: [
                ExpansionPanelRadio(
                  value: 'A',
                  headerBuilder: (context, isExpanded) => const ListTile(title: Text('单开模式面板A')),
                  body: const ListTile(title: Text('只能展开一个面板')), 
                ),
                ExpansionPanelRadio(
                  value: 'B',
                  headerBuilder: (context, isExpanded) => const ListTile(title: Text('单开模式面板B')),
                  body: const ListTile(title: Text('点击切换展开')), 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PanelItem {
  final String header;
  final String body;
  bool isExpanded;
  _PanelItem(this.header, this.body, {this.isExpanded = false});
}

class _ExpansionPanelSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _ExpansionPanelSection({
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