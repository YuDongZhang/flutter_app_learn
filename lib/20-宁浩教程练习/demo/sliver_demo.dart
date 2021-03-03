import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/model/post.dart';

/// sliver 翻译是条子薄片的意思
class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverPadding(padding: EdgeInsets.all(8.0),sliver: SliverGridDemo()),
          // SliverSafeArea(sliver: SliverGridDemo())//显示在安全区域 , 就是避免被刘海挡住
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
            ),

          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        //delegate 代表的意思
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 32), //只是添加底边距

            child: Material(
                borderRadius: BorderRadius.circular(12.0), //实际测试发现无效
                elevation: 14.0,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9, //图片的比例
                      child: Image.network(
                        posts[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 32.0,
                      left: 32.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            posts[index].title,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Text(
                            posts[index].author,
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                )

                // Container(
                //   // width: 120,//设置了之后可以看到圆角 ,不过不是图片的
                //   // height: 60,
                //   child: Image.network(
                //     posts[index].imageUrl,
                //     fit: BoxFit.contain,
                //   ),
                //
                // ),

                ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0, //网格显示的比例
      ),
      delegate: SliverChildBuilderDelegate(
        //delegate 代表的意思
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
