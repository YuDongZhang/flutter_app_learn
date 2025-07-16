import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarDemoState();
  }
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  void _onTapHandler(int index) {
    //这种写法主要是为了能够激活 , index 为用户按的值 ,下面是默认传的
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      //表示目前是那个激活了 , 用 一个变量代替
      onTap: _onTapHandler,
      type: BottomNavigationBarType.fixed,
      //超过了 3 个不显示 , 设置类型
      fixedColor: Colors.black,
      //设置选中的 颜色
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: '什么情况'),
        //title 过时了
        BottomNavigationBarItem(icon: Icon(Icons.history), label: '什么情况'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: '什么情况'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '什么情况'),
      ],
    );
  }
}
