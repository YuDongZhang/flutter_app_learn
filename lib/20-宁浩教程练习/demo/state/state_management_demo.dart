import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

//用了 model 之后StatefulWidget可以改造成为 stateless
class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(), //这样下面的小部件可以设置到model 里面的东西
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0,
        ),
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false, //默认在 model改变的时候会重建 , 不过在本视图中不用重建
            builder: (context, _, model) => FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: model.increaseCount,
                )),
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
    return ScopedModelDescendant<CounterModel>(
        builder: (context, _, model) =>
            ActionChip(
              label: Text('${model.count}'),
              onPressed: model.increaseCount, //执行的是一个回调
            ));
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

class CounterModel extends Model {
  int _count = 0;

  int get count => _count;

  void increaseCount() {
    _count += 1;
    notifyListeners(); //重建 , 监听的小部件会被重建
  }
}
