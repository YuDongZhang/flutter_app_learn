import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Text('Home'),
              onPressed: null,
            ),
            TextButton(
              child: Text('About'),
              onPressed: () {
                ///直接用名字就可以推 , 通过定义好的 routes
                Navigator.pushNamed(context, '/about');
                ///route即时路由(就是一个视图) , stack 放路由的堆 , navigator 操作路由
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => PageNav(
                //           title: 'about',
                //         )));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PageNav extends StatelessWidget {
  final String title;

  PageNav({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
