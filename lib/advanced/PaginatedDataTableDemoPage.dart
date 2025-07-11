import 'package:flutter/material.dart';

class PaginatedDataTableDemoPage extends StatefulWidget {
  const PaginatedDataTableDemoPage({super.key});

  @override
  State<PaginatedDataTableDemoPage> createState() => _PaginatedDataTableDemoPageState();
}

class _PaginatedDataTableDemoPageState extends State<PaginatedDataTableDemoPage> {
  int? _sortColumnIndex;
  bool _sortAscending = true;
  final _postsDataSource = _DemoPostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PaginatedDataTable 分页表控件详解')),
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
                  Text('PaginatedDataTable 支持大数据量表格的分页展示，常用于管理后台、数据分析等场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 PaginatedDataTable 的基本用法、数据源、排序、最佳实践等。'),
                ],
              ),
            ),
          ),
          _PaginatedTableSection(
            title: '基本用法',
            description: 'PaginatedDataTable 通过 DataTableSource 管理数据，支持分页、排序。',
            code: '''PaginatedDataTable(
  header: Text('标题'),
  rowsPerPage: 5,
  source: dataSource,
  columns: [
    DataColumn(label: Text('标题')),
    ...
  ],
)''',
            demo: PaginatedDataTable(
              header: const Text('演示数据'),
              rowsPerPage: 3,
              source: _postsDataSource,
              columns: [
                DataColumn(label: const Text('标题')),
                DataColumn(label: const Text('作者')),
                DataColumn(label: const Text('图片')),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _PaginatedTableSection(
            title: '自定义数据源 DataTableSource',
            description: '需继承 DataTableSource，实现 getRow、rowCount、isRowCountApproximate、selectedRowCount。',
            code: '''class MyDataSource extends DataTableSource {
  @override
  DataRow getRow(int index) => ...;
  @override
  int get rowCount => ...;
  @override
  bool get isRowCountApproximate => false;
  @override
  int get selectedRowCount => ...;
}''',
            demo: const Text('见下方表格源码实现'),
          ),
          const SizedBox(height: 24),
          _PaginatedTableSection(
            title: '排序',
            description: 'DataColumn 的 onSort 可实现排序，DataTableSource 需实现排序逻辑。',
            code: '''DataColumn(
  label: Text('标题'),
  onSort: (columnIndex, ascending) {
    dataSource.sort(...);
  },
)''',
            demo: PaginatedDataTable(
              header: const Text('可排序演示'),
              rowsPerPage: 3,
              source: _postsDataSource,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns: [
                DataColumn(
                  label: const Text('标题'),
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;
                      _postsDataSource.sort((p) => p.title.length, ascending);
                    });
                  },
                ),
                DataColumn(label: const Text('作者')),
                DataColumn(label: const Text('图片')),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _PaginatedTableSection(
            title: '最佳实践',
            description: '''1. 适合大数据量表格。
2. 建议分页行数不宜过多。
3. 数据源建议继承 DataTableSource。
4. 可结合排序、筛选、选择等功能。''',
            code: '''PaginatedDataTable(
  rowsPerPage: 10,
  source: dataSource,
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

class _DemoPostDataSource extends DataTableSource {
  final List<_DemoPost> _posts = [
    _DemoPost('Candy Shop', 'Mohamed', 'https://resources.ninghao.net/images/candy-shop.jpg'),
    _DemoPost('Dragon', 'Chahin', 'https://resources.ninghao.net/images/dragon.jpg'),
    _DemoPost('Icecream Truck', 'Mohamed', 'https://resources.ninghao.net/images/icecream-truck.jpg'),
    _DemoPost('Space Skull', 'Mohamed', 'https://resources.ninghao.net/images/space-skull.jpg'),
    _DemoPost('Overkill', 'Mohamed', 'https://resources.ninghao.net/images/overkill.jpg'),
  ];
  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final post = _posts[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl, width: 40, height: 40)),
      ],
    );
  }

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void sort<T extends Comparable>(T Function(_DemoPost p) getField, bool ascending) {
    _posts.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }
}

class _PaginatedTableSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _PaginatedTableSection({
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