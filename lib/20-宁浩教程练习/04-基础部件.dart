import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/basic_demo.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/bottom_navigation_bar_demo.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/drawer-demo.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/form_demo.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/layout_demo.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/navigator_demo.dart';
import 'demo/listview-demo.dart';
import 'demo/view_demo.dart';

void main() => runApp(App());

///2,material 组件
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //关闭debug 条幅
      // home: NavigatorDemo(),
      ///定义的初始的路由
      initialRoute: '/form',
      ///事先定义好一些带名字的路由 , 然后直接 push 名字
      ///routes 值是 map
      routes: {
        //对应要显示的 就是 weidgtbuilder , 接收的是上面的context
        /// 值里面 前面的前面的 '/' 表示就是 根路由 , 就是上面的home , 如果不用 可以定义
        // '/':(context)=>NavigatorDemo(),
        '/':(context)=>Home(),
        '/about':(context)=>PageNav(title:'你好'),
        '/form':(context)=>FormDemo(),
      },
      theme: ThemeData(
          //主题颜色修改 , 不要这一行是 蓝色
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //设置主题的高亮颜色
          splashColor: Colors.white70 //设置 水波纹
          ),
    );
  }
}

/// home 组件
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          //主页中的 scaffold
          appBar: AppBar(
            ///有抽屉会自动的添加的
            // leading: IconButton(
            //   //默认打开抽屉 , 如果 不加 onPressed:
            //   //标题左边区域
            //   icon: Icon(Icons.menu),
            // ),
            centerTitle: true,
            //标题文字居中
            title: Text('你好'),
            actions: [
              //这里可以添加很多的小部件
              IconButton(
                  //标题左边区域
                  icon: Icon(Icons.search),
                  tooltip: 'navigation',
                  onPressed: () => debugPrint('点击了导航栏'))
            ],
            elevation: 0,
            //阴影
            bottom: TabBar(
              unselectedLabelColor: Colors.black38,
              //没有选择的颜色
              indicatorColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.label,
              //可以设置和图标的大小一致
              indicatorWeight: 1.0,
              tabs: [
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.view_agenda)),
              ],
            ),
          ),
          body: TabBarView(children: [
            //tabbarview 和 tab 是联动的, 复制的 tabcontrol
            // Tab(
            //   icon: Icon(
            //     Icons.local_florist,
            //     size: 128,
            //     color: Colors.black12,
            //   ),
            // ),
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            ViewDemo(),
          ]),
          drawer: DrawerDemo(),
          bottomNavigationBar: BottomNavigationBarDemo(),
        ));
  }
}

class DrawerOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      ////左边 抽屉, 右边抽屉 是enddrawer
      color: Colors.white, //抽屉的背景色
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //主轴对齐
        children: [
          Text('this is drawer'),
        ],
      ),
    );
  }
}
