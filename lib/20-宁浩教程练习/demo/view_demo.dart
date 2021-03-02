import 'package:flutter/material.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewCountDemo();
  }
}

class GridViewCountDemo extends StatelessWidget {

  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text('Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      scrollDirection: Axis.horizontal,//水平滚动
      crossAxisSpacing: 16.0,//间隔
      mainAxisSpacing: 16.0,//竖向的间隔
      children: _buildTiles(100),

    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: [
        SizedBox.expand(
          //这样 box 尺寸会占满所有的空间
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: 8.0, //设置部件底部位置
            left: 8.0, //设置部件左边的位置
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //交叉轴的对其
              children: [
                Text(
                  posts[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  posts[index].author,
                )
              ],
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}

///页面视图 ,可以设置一页一页 可以竖向和横向的滑动
class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: false,
      //页面的粘性 , 拖到一半不到会退回去
      reverse: false,
      //倒置 , 页面的顺序颠倒
      scrollDirection: Axis.vertical,
      //滚动的方向
      onPageChanged: (currentPage) => debugPrint('Page : $currentPage'),
      //可以在控制台打印当前的页面
      controller: PageController(
        initialPage: 1, //默认滚动到 第二 个页面
        keepPage: false, //是否记住了 , 滚动到那个页面
        viewportFraction: 0.85, //页面占用 可视图的 比例
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
