import 'package:flutter/material.dart';
import '../model/post.dart';

//数据源
class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length; //数量

  @override
  bool get isRowCountApproximate => false; //是否确定行的数量

  @override
  int get selectedRowCount => _selectedCount; //选中行数

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];

    return DataRow.byIndex( //返回的是每一行具体的类容
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Image.network(post.imageUrl)),
      ],
    );
  }

  void _sort(getField(post), bool ascending) {
    _posts.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }
}


class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  late int _sortColumnIndex;
  bool _sortAscending = true;

  final PostDataSource _postsDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DataTableDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              PaginatedDataTable(
                header: Text('Posts'),
                rowsPerPage: 5,
                //每一页的行数
                source: _postsDataSource,
                sortColumnIndex: _sortColumnIndex,
                //排序的索引号
                sortAscending: _sortAscending,
                //sortAscending true 升序排列 , false 降序
                // onSelectAll: (bool value) {},全选的状态 , 默认带全选功能
                columns: [
                  //数据表格的栏目
                  DataColumn(
                      label: Text('Title'), //container 包含设置宽度 , 好像都不能自己设置宽度
                      onSort: (int columnIndex, bool ascending) {
                        //方法里面接收参数
                        _postsDataSource._sort((post) => post.title.length, ascending);
                        //index当前要排序的索引号 ,ascending 是否升序排列
                        setState(() {
                          _sortColumnIndex = columnIndex;
                          _sortAscending = ascending;
                        });
                      }),
                  DataColumn(
                    label: Text('Author'),
                  ),
                  DataColumn(
                    label: Text('Image'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
