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
                    label: Text('Title'),
                  ),
                  DataColumn(
                    label: Text('Author'),
                  ),
                ],
                //rows 每一行
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('hello')),
                      DataCell(Text('老张')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('ola')),
                      DataCell(Text('老张')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('你好')),
                      DataCell(Text('老张')),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
