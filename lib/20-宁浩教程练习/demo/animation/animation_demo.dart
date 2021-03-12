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

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;

  @override
  void initState() {
    super.initState();

    animationDemoController = AnimationController(
      //初始的值
      value: 32.0,
      lowerBound: 0.0,
      upperBound: 100.0,
      duration: Duration(milliseconds: 3000),
      //持续的时间
      //防止屏幕的消耗不必要的资源
      vsync: this,
    );

    //监听动画
    animationDemoController.addListener(() {
      //输出每一帧 控制的值
      // print('$animationDemoController.value');
      setState(() {});
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
      child: ActionChip(
        label: Text('$animationDemoController.value'),
        onPressed: () {
          animationDemoController.forward();
        },
      ),
    );
  }
}
