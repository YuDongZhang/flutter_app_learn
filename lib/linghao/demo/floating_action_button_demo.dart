import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 0.0,
      backgroundColor: Colors.black87,
      //可以设置他的形状
      // shape: BeveledRectangleBorder(
      //   borderRadius: BorderRadius.circular(30.0)
      // ),
    );

    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('Add'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      //_floatingActionButtonExtended //替换测试
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //按钮的位置
      bottomNavigationBar: BottomAppBar(
        //底部工具栏
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(), //底部工具栏的缺口 , 你可以看效果
      ),
    );
  }
}