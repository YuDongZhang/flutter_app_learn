import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'demo/animation/animation_demo.dart';
import 'demo/basic_demo.dart';
import 'demo/bloc/BlocDemo.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/drawer-demo.dart';
import 'demo/form_demo.dart';
import 'demo/http/http_demo.dart';
import 'demo/i18n/i18n_demo.dart';
import 'demo/i18n/intl/ninghao_demo_localizations.dart';
import 'demo/layout_demo.dart';
import 'demo/listview-demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/rxdart/rxdart_demo.dart';
import 'demo/stream/stream_demo.dart';
import 'demo/view_demo.dart';
import 'demo/material_components.dart';

void main() => runApp(App());

///2,material 组件
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('en', 'US'),
      //应用要使用本地化的设置
      // localeResolutionCallback:(Locale locale,Iterable<Locale> supportedLocales){
      //       //   return locale('en','US')
      //       // } ,
      // locale: Locale('zh', 'CN'),
      localizationsDelegates: [
        NinghaoDemoLocalizationsDelegate(), //看上面更换了导入文件
        GlobalMaterialLocalizations.delegate, //Material组件国际化
        GlobalWidgetsLocalizations.delegate //文字的方向
      ],
      supportedLocales: [Locale('en', 'US'), Locale('zh', 'CN')],
      debugShowCheckedModeBanner: false,
      //关闭debug 条幅
      // home: NavigatorDemo(),
      ///定义的初始的路由
      initialRoute: '/',

      ///事先定义好一些带名字的路由 , 然后直接 push 名字
      ///routes 值是 map
      routes: {
        //对应要显示的 就是 weidgtbuilder , 接收的是上面的context
        /// 值里面 前面的前面的 '/' 表示就是 根路由 , 就是上面的home , 如果不用 可以定义
        // '/':(context)=>NavigatorDemo(),
        '/': (context) => Home(),
        '/about': (context) => PageNav(title: '你好'),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),
        // '/state_manage': (context) => StateManagementDemo(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxDartDemo(),
        '/Bloc': (context) => BlocDemo(),
        '/http': (context) => HttpDemo(),
        '/Animation': (context) => AnimationDemo(),
        '/I18nDemo': (context) => I18nDemo(),
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
