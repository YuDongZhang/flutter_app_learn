import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
        child: StreamBuilder(
      initialData: 0,

      ///4.根据这个数据构建了下面的小部件 , 与变化自动更新
      stream: _counterBloc.count,

      builder: (context, snapshot) {
        return ActionChip(
            label: Text('${snapshot.data}'),
            //data是 _counterBloc.count上 stream里的数据
            onPressed: () {
              ///1,按下按钮会使用counter里sink往stream加数据
              _counterBloc.counter.add(1);
            });
      },
    ));
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // _counterBloc.log();
          _counterBloc.counter.add(1);
        });
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  CounterProvider({
    this.child,
    this.bloc,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;

  final _counterActionController = StreamController<int>();

  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>();

  Stream<int> get count => _counterController.stream;

  CounterBloc() {
    ///2 , 监听了数据 , 有数据会执行 ondata 方法 ,
    _counterActionController.stream.listen(onData); //监听
  }

  void onData(int data) {
    print('$data');
    _count = data + _count;

    ///3 , 改变了值将值交给_counterController控制的stream
    _counterController.add(_count);
  }

  void disponse() {
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('BLoC');
  }
}
