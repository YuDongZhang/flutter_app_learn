import 'dart:ui';

import 'package:flutter/material.dart';
import 'model/post.dart';

/// 从下 往 上 看
// void main() {
//   //挂载 应用的根 , 所有的都是 widget , widget 包含 widget
//
//   ///这里只有一行代码  , 可以用 =>
//   // runApp(
//   //   App()
//   // );
//
//   runApp() => App();
// }

void main() => runApp(App());

///2,material 组件
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
          //主题颜色修改 , 不要这一行是 蓝色
          primarySwatch: Colors.yellow),
    );
  }
}

/// home 组件
class Home extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    // return Text(posts[index].title);
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        //这个表示是竖向的
        children: [
          Image.network(posts[index].imageUrl),
          SizedBox(
            height: 16.0,
          ),
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 16.0,)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //主页中的 scaffold
      appBar: AppBar(
        centerTitle: true, //标题文字居中
        title: Text('你好'),
      ),
      body: ListView.builder(
        itemBuilder: _listItemBuilder,
        itemCount: posts.length,
      ),
    );
  }
}

///1,自定义一个小部件
//StatelessWidget 翻译 , 无状态小部件 , 即是 不需要修改的
//StatefulWidget 翻译, 有状态小部件 , 即是 可以修改的
class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //这个方法 返回的小部件
    // TODO: implement build
    return Center(
      //这个也是一个 widget
      child: Text(
        //center 属性child 对于的 值是 text ,text是个 widget
        'hello',
        textDirection: TextDirection.rtl, //文字顺序
        style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold, //字体属性
            color: Colors.yellow),
      ),
    );
  }
}
