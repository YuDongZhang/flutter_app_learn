import 'package:flutter/material.dart';

import '../model/post.dart';
import 'post_show.dart';

class ListViewDemo extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    // return Text(posts[index].title);
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
              ),
              SizedBox(height: 16.0),
              Text(posts[index].title,
                  style: Theme.of(context).textTheme.titleSmall),
              Text(posts[index].author,
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16.0),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(//渐墨 效果
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.1),//高亮
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PostShow(post: posts[index]))
                    );
                  }),
            ),
          ),
        ],
      ),

      // Column(
      //   //这个表示是竖向的
      //   children: [
      //     Image.network(posts[index].imageUrl),
      //     SizedBox(
      //       height: 16.0,
      //     ),
      //     Text(
      //       posts[index].title,
      //       style: Theme.of(context).textTheme.title,
      //     ),
      //     Text(
      //       posts[index].author,
      //       style: Theme.of(context).textTheme.subtitle1,
      //     ),
      //     SizedBox(height: 16.0,)
      //   ],
      // ),

    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: _listItemBuilder,
      itemCount: posts.length,
    );
  }
}
