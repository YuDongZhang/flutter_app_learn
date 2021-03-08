import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

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
              DataTable(
                sortColumnIndex: _sortColumnIndex, //排序的索引号
                sortAscending: _sortAscending, //true 升序排列 , false 降序
                columns: [
                  //数据表格的栏目
                  DataColumn(
                      label: Text('Title'), //container 包含设置宽度 , 好像都不能自己设置宽度
                      onSort: (int index, bool ascending) {
                        //index当前要排序的索引号 ,ascending 是否升序排列
                        setState(() {
                          _sortColumnIndex = index;
                          _sortAscending = ascending;
                          //sort 这个方法里面的方法就是排序的方法
                          posts.sort((a, b) {
                            //调换 a 和 b 的值
                            if (!ascending) {
                              final c = a;
                              a = b;
                              b = c;
                            }
                            //返回对比的结果
                            return a.title.length
                                .compareTo(b.title.length); //比较标题的长度
                          });
                        });
                      }),
                  DataColumn(
                    label: Text('Author'),
                  ),
                  DataColumn(
                    label: Text('Image'),
                  ),
                ],
                //rows 每一行
                rows: posts.map((post) {
                  return DataRow(cells: [
                    DataCell(
                      Text(post.title), //post 即是 map后面的 post
                    ),
                    DataCell(
                      Text(post.author),
                    ),
                    DataCell(
                      Image.network(post.imageUrl),
                    ),
                  ]);
                }).toList(),
              ),
            ],
          ),
        ));
  }
}
