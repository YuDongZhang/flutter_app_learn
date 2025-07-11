import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'http://139.196.248.235:8089/clt/image/4/96/427.jpg'),
              alignment: Alignment.topCenter, //图片位置
              // repeat: ImageRepeat.repeat,//图片重复
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.indigoAccent[400].withOpacity(0.5),//滤镜颜色 , 透明度 , 下面是混合模式
                  BlendMode.hardLight))),
      // color: Colors.grey[100],//图片设置后这个会报错
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, //让图标居中
        children: [
          Container(
              child: Icon(
                Icons.pool,
                size: 32.0,
                color: Colors.white, //图标颜色
              ),
              // color: Color.fromRGBO(3, 54, 255, 1.0),//装饰属性放到修饰中区
              //最后一个是透明度
              padding: EdgeInsets.all(16.0),
              //内边距
              margin: EdgeInsets.all(8.0),
              //外边距
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                //修饰的意思
                color: Color.fromRGBO(3, 54, 255, 1.0),

                ///阴影添加
                boxShadow: [
                  BoxShadow(
                      //阴影
                      offset: Offset(6, 16), //偏移量
                      color: Color.fromRGBO(3, 54, 255, 1.0), //颜色
                      blurRadius: 1.0, //模糊程度
                      spreadRadius: 3 //阴影扩大的面积 , 负值为缩小

                      )
                ],
                // shape: BoxShape.circle,
                //盒子形状 , 在圆形盒子上不能使用 圆角效果

                // gradient: RadialGradient( //镜像渐变
                //   colors: [
                //     Color.fromRGBO(7, 102, 255, 1.0),
                //     Color.fromRGBO(3, 28, 128, 1.0),
                //   ],
                // ),
                gradient: LinearGradient(
                  //线性渐变
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                  begin: Alignment.topCenter, //上到下
                  end: Alignment.bottomCenter,
                ),

                ///添加统一的圆角
                // borderRadius: BorderRadius.circular(16.0),

                ///单独的 角添加圆形
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(64.0),
                //   bottomLeft: Radius.circular(64.0)
                // )

                ///给所有的 角 添加
                border: Border.all(
                  color: Colors.indigoAccent[100],
                  width: 3.0,
                  style: BorderStyle.solid,
                ),

                /// 单独给某个角添加
                // border: Border(
                // top: BorderSide(
                //   color: Colors.indigoAccent[100],
                //   width: 3.0,
                //   style: BorderStyle.solid,
                // )
              )),
        ],
      ),
    );
  }
}

///富文本
class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'ZhangYuDong',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 34.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w100, //粗细
          ),
          children: [
            TextSpan(
                text: '.net',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.grey,
                ))
          ]),
    );
  }
}

/// 简单的文本
class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );

  final String _author = '李白'; // _ 开头的一般是类里私有的
  final String _title = '将进酒';

  @override
  Widget build(BuildContext context) {
    return Text(
      '《 $_title 》—— $_author。君不见黄河之水天上来，奔流到海不复回。君不见高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
