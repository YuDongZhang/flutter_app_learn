import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///单独设置的主题
      body: Theme(
        data: ThemeData(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  TextFieldDemoState createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  @override
  Widget build(BuildContext context) {

    return TextField(
      ///负责输入的监听
      onChanged: (value){
        debugPrint(value);
      },
      ///点击确定按钮时候的值
      onSubmitted: (value){
        debugPrint('submit + $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),//文本框左边的小图标
        labelText: '我是输入框',
        hintText: '点击我可以输入',
        // border: InputBorder.none,//取消了下划线
        border: OutlineInputBorder(),
        filled: true,
        // fillColor:  ,设置背景颜色
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //借用主页的主题
      color: Theme.of(context).accentColor,
    );
  }
}
