import 'package:flutter/material.dart';
import '../model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts.map((post) {
            return Card(
              child: Column(
                children: <Widget>[
                  AspectRatio(//比利
                    aspectRatio: 16/9,
                    child: ClipRRect(//裁切圆角
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.network(
                        post.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(post.imageUrl),
                    ),
                    title: Text(post.title),
                    subtitle: Text(post.author),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    //设置为两行 , 后面会显示省略号
                    child: Text(post.description, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text('Like'.toUpperCase()),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text('Read'.toUpperCase()),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      )
    );
  }
}