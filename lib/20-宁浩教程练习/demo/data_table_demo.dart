import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
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
                columns: [
                  //数据表格的栏目
                  DataColumn(
                    label: Text('Title'), //container 包含设置宽度 , 好像都不能自己设置宽度
                  ),
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
