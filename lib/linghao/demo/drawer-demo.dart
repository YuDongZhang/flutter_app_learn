import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, //内边距 为 0
        children: [

          ///头部
          // DrawerHeader(
          //   child: Text('header'),
          //   decoration: BoxDecoration(color: Colors.grey[100]),
          // ),
          ///账户头部
          UserAccountsDrawerHeader(
            accountName: Text('lao zhang'),
            accountEmail: Text('977872239@qq.com'),
            currentAccountPicture: CircleAvatar(
              //圆形的用户图像
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/16448943?s=60&v=4'),
            ),
            decoration: BoxDecoration(
                color: Colors.yellow[400], //添加一个背景色
                image: DecorationImage(
                    image: NetworkImage(
                        "http://139.196.248.235:8089/clt/image/4/96/419.jpg"),
                    fit: BoxFit.cover, //图片撑起
                    colorFilter: ColorFilter.mode(
                        Colors.orange.withOpacity(0.6), //滤镜透明度
                        BlendMode.srcOver))), //混合模式
          ),

          ListTile(
            title: Text(
              'message',
              textAlign: TextAlign.right,
            ), //标题
            trailing: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22.0,
            ),
          ),
          ListTile(
            title: Text(
              'favorite',
              textAlign: TextAlign.right,
            ), //标题
            trailing: Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
          ),
          ListTile(
            title: Text(
              'settings',
              textAlign: TextAlign.right,
            ), //标题
            trailing: Icon(
              //leading 表示在开头 ,training 末尾
              Icons.settings,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context), //点击抽屉条目的时候 , 抽屉会关闭
          ),
        ],
      ),
    );
  }
}