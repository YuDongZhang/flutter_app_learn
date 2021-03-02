

import 'package:flutter/material.dart';

class ViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PageViewDemo();
  }

}

///页面视图 ,可以设置一页一页 可以竖向和横向的滑动
class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: false,//页面的粘性 , 拖到一半不到会退回去
      reverse: false,//倒置 , 页面的顺序颠倒
      scrollDirection: Axis.vertical,//滚动的方向
      onPageChanged: (currentPage)=> debugPrint('Page : $currentPage'),//可以在控制台打印当前的页面
      controller: PageController(
        initialPage: 1,//默认滚动到 第二 个页面
        keepPage: false,//是否记住了 , 滚动到那个页面
        viewportFraction: 0.85,//页面占用 可视图的 比例
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text('ONE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text('TWO',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text('THREE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
      ],
    );
  }
}
