import 'package:flutter/material.dart';

import 'counter_bloc_demo.dart';

//他的缩写其实就是把应用需要的业务逻辑单独放到一个类里面 bloc
//这个类似于响应式 或者说的 反应式
//比如购物车 , 用户按了商品上的添加 , 应用其他的几个地方可能要做反应 , 比如更新数量
//StreamController 里面 sink 为了往 stream里面添加数据 , 可以在bloc里面添加sink
//然后在应用里面使用sink , 然后监听 , 有变化的时候更改
class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
        bloc: CounterBloc(), //下面的小部件 可以得到counterbloc 里面的东西
        child: Scaffold(
          appBar: AppBar(
            title: Text('BlocDemo'),
            elevation: 0,
          ),
          body: CounterHome(),
          floatingActionButton: CounterActionButton(),
        ));
  }
}
