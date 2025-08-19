import 'package:flutter/material.dart';

class DataTableDemoPage extends StatefulWidget {
  const DataTableDemoPage({super.key});

  @override
  State<DataTableDemoPage> createState() => _DataTableDemoPageState();
}

class _DataTableDemoPageState extends State<DataTableDemoPage> {
  int? _sortColumnIndex;
  bool _sortAscending = true;
  List<_DemoPost> _posts = [
    _DemoPost('Candy Shop', 'Mohamed', 'https://resources.ninghao.net/images/candy-shop.jpg'),
    _DemoPost('Dragon', 'Chahin', 'https://resources.ninghao.net/images/dragon.jpg'),
    _DemoPost('Icecream Truck', 'Mohamed', 'https://resources.ninghao.net/images/icecream-truck.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DataTable 数据表控件详解')),
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
                  Text('DataTable 用于展示结构化数据，支持排序、选择、定制列等，常用于管理后台、数据展示等场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 DataTable 的基本用法、排序、行选择、自定义单元格等。'),
                ],
              ),
            ),
          ),
          _DataTableSection(
            title: '基本用法',
            description: 'DataTable 通过 columns 定义表头，rows 定义数据行。',
            code: '''DataTable(
  columns: [
    DataColumn(label: Text('标题')),
    DataColumn(label: Text('作者')),
    DataColumn(label: Text('图片')),
  ],
  rows: [
    DataRow(cells: [
      DataCell(Text('Candy Shop')),
      DataCell(Text('Mohamed')),
      DataCell(Image.network('...')),
    ]),
  ],
)''',
            demo: DataTable(
              columns: const [
                DataColumn(label: Text('标题')),
                DataColumn(label: Text('作者')),
                DataColumn(label: Text('图片')),
              ],
              rows: _posts.map((post) {
                return DataRow(cells: [
                  DataCell(Text(post.title)),
                  DataCell(Text(post.author)),
                  DataCell(Image.network(post.imageUrl, width: 40, height: 40)),
                ]);
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          _DataTableSection(
            title: '排序',
            description: 'DataTable 支持对列排序，通过 onSort 回调实现。',
            code: '''DataTable(
  sortColumnIndex: sortColumnIndex,
  sortAscending: sortAscending,
  columns: [
    DataColumn(
      label: Text('标题'),
      onSort: (index, ascending) {
        // 排序逻辑
      },
    ),
    ...
  ],
)''',
            demo: DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                  label: const Text('标题'),
                  onSort: (index, ascending) {
                    setState(() {
                      _sortColumnIndex = index;
                      _sortAscending = ascending;
                      _posts.sort((a, b) => ascending
                          ? a.title.length.compareTo(b.title.length)
                          : b.title.length.compareTo(a.title.length));
                    });
                  },
                ),
                const DataColumn(label: Text('作者')),
                const DataColumn(label: Text('图片')),
              ],
              rows: _posts.map((post) {
                return DataRow(cells: [
                  DataCell(Text(post.title)),
                  DataCell(Text(post.author)),
                  DataCell(Image.network(post.imageUrl, width: 40, height: 40)),
                ]);
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          _DataTableSection(
            title: '行选择',
            description: 'DataRow 的 selected 和 onSelectChanged 可实现行的选中。',
            code: '''DataRow(
  selected: selected,
  onSelectChanged: (val) {
    // 选中/取消
  },
)''',
            demo: DataTable(
              columns: const [
                DataColumn(label: Text('标题')),
                DataColumn(label: Text('作者')),
                DataColumn(label: Text('图片')),
              ],
              rows: _posts.map((post) {
                return DataRow(
                  selected: post.selected,
                  onSelectChanged: (val) {
                    setState(() => post.selected = val ?? false);
                  },
                  cells: [
                    DataCell(Text(post.title)),
                    DataCell(Text(post.author)),
                    DataCell(Image.network(post.imageUrl, width: 40, height: 40)),
                  ],
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          _DataTableSection(
            title: '自定义单元格',
            description: 'DataCell 可自定义内容，如图片、按钮、富文本等。',
            code: '''DataCell(
  Row(children: [
    Icon(Icons.star),
    Text('自定义'),
  ]),
)''',
            demo: DataTable(
              columns: const [
                DataColumn(label: Text('标题')),
                DataColumn(label: Text('操作')),
              ],
              rows: _posts.map((post) {
                return DataRow(cells: [
                  DataCell(Text(post.title)),
                  DataCell(Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('查看 ${post.title}')),
                          );
                        },
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.star, color: Colors.amber),
                    ],
                  )),
                ]);
              }).toList(),
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
  bool selected;
  _DemoPost(this.title, this.author, this.imageUrl, {this.selected = false});
}

class _DataTableSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _DataTableSection({
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