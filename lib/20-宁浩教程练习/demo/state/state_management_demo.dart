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
    return CounterProvider(
      //这样在这个部件下的小部件都可以得到 这个两个参数
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0,
        ),
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider
        .of(context)
        .count;
    final VoidCallback increaseCount = CounterProvider
        .of(context)
        .increaseCount;
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount, //执行的是一个回调
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount; //回调
  final Widget child;

  CounterProvider({this.count, this.increaseCount, this.child})
      : super(child: child); //

  //在其他的小部件中采用 of 得到state
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  //通知继承这个小部件的小部件 , 是否重建
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
