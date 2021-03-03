import 'package:flutter/material.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/model/post.dart';
/// sliver 翻译是条子薄片的意思
class SliverDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverPadding(padding: EdgeInsets.all(8.0),sliver: SliverGridDemo()),
          // SliverSafeArea(sliver: SliverGridDemo())//显示在安全区域 , 就是避免被刘海挡住
          SliverSafeArea(sliver: SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGridDemo(),
          ),)
        ],
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
        childAspectRatio: 1.0,//网格显示的比例
      ),
      delegate: SliverChildBuilderDelegate(//delegate 代表的意思
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