import 'package:flutter/material.dart';

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