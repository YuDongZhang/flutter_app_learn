import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() =>_StateManagementDemoState();

}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0,
      ),body: Center(
      child: Chip(label: Text('$_count')),
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){ //发生变化要放到 setstate
          setState(() { //新的状态进行重建
            _count += 1;
          });
        },
      ),
    );
  }

}

