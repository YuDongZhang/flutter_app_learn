import 'package:flutter/material.dart';

class StateManagementDemo extends StatelessWidget {
  int count = 0;

  @override //架构再把这个小部件插入到树里面的时候 ,会调用 build 方法
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0,
      ),body: Center(
      child: Chip(label: Text('$count')),
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          count += 1;
        },
      ),
    );
  }
}

