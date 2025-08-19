import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome> with TickerProviderStateMixin {
  late AnimationController animationDemoController;
  late Animation animation;
  late Animation animationColor;
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
      //初始的值
      // value: 32.0,
      // lowerBound: 32.0,
      // upperBound: 100.0,
      duration: Duration(milliseconds: 3000),
      //持续的时间
      //防止屏幕的消耗不必要的资源
      vsync: this,
    );

    curve = CurvedAnimation(parent: animationDemoController, curve: Curves.bounceInOut);

    //监听动画
    animationDemoController.addListener(() {
      //输出每一帧 控制的值
      // print('$animationDemoController.value');
      setState(() {});
    });

    animation = Tween(begin: 32.0, end: 100.0).animate(animationDemoController);
    animationColor = ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);

    //监听动画的状态 , 是否完成
    animationDemoController.addStatusListener((status) {
      print(status);
    });

    //开始播放动画
    // animationDemoController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.favorite),
        iconSize: animation.value,
        color: animationColor.value,
        onPressed: () {
          switch (animationDemoController.status) {
            case AnimationStatus.completed:
              animationDemoController.reverse();
              break;
            default:
              animationDemoController.forward();
          }
        },
      ),
    );
  }
}
