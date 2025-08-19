import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String _currentMenuItem = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PopupMenuButtonDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(_currentMenuItem), //text 显示的值 , 可以用直接看到的 , 你选择的值
                  PopupMenuButton<String>(//这个地方以前是没有泛型，现在添加了泛型
                    onSelected: (value) {
                      //被选择的菜单项的值
                      print(value);
                      setState(() {
                        _currentMenuItem = value;
                      });
                    },
                    itemBuilder: (BuildContext context) => [
                      //菜单里面的项目
                      PopupMenuItem(
                        value: 'Home',
                        child: Text('Home'),
                      ),
                      PopupMenuItem(
                        value: 'Discover',
                        child: Text('Discover'),
                      ),
                      PopupMenuItem(
                        value: 'Community',
                        child: Text('Community'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
