import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;

  void _increaseCount() {
    //发生变化要放到 setstate
    setState(() {
      //新的状态进行重建
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0,
      ),
      body: Counter(_count, _increaseCount),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increaseCount,
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount; //回调

  Counter(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed:increaseCount,//执行的是一个回调
      ),
    );
  }
}
