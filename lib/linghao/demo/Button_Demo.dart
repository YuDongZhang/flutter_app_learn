import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //带文字的按钮
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
            child: Text('Button'),
            onPressed: () {}, //如果为null 就是禁用
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.secondary,
            )),
        TextButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
        ),
      ],
    );

    //背景颜色和阴影效果
    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            //覆盖一些主题
            buttonTheme: ButtonThemeData(
              //定义按钮主题
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(//按钮的形状
              //   borderRadius: BorderRadius.circular(5.0),
              // ),
              shape: StadiumBorder(), //按钮形状
            ),
          ),
          child: ElevatedButton(
            child: Text('Button'),
            onPressed: () {},

            // color: Theme.of(context).accentColor,//按钮的背景色
            // textColor: Colors.white,//按钮文字颜色
            // textTheme: ButtonTextTheme.primary,//文字颜色 和上面效果一样
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},

        ),
      ],
    );

    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(

            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(5.0),
              // ),
              shape: StadiumBorder(),
            ),
          ),
          child: OutlinedButton(
            child: Text('Button'),
            onPressed: () {},

            // textTheme: ButtonTextTheme.primary,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        OutlinedButton.icon(
          icon: Icon(Icons.add),
          //小图标
          label: Text('Button'),
          onPressed: () {},

        ),
      ],
    );

    final Widget fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 130.0,
          child: OutlinedButton(
            child: Text('Button'),
            onPressed: () {},

          ),
        ),
      ],
    );

    final Widget expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          //占满宽度
          child: OutlinedButton(
            child: Text('Button'),
            onPressed: () {},

          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          flex: 2, //比例 这个有点像那个 weight
          child: OutlinedButton(
            child: Text('Button'),
            onPressed: () {},

          ),
        ),
      ],
    );

    // 按钮容器 ButtonBar：一组带边距的横排显示按钮
    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              //边距会根据这个来改变
              padding: EdgeInsets.symmetric(horizontal: 32.0),
            ),
          ),
          child: OverflowBar(
            children: <Widget>[
              OutlinedButton(
                child: Text('Button'),
                onPressed: () {},

              ),
              OutlinedButton(
                child: Text('Button'),
                onPressed: () {},

              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('button'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            flatButtonDemo,
            raisedButtonDemo,
            outlineButtonDemo,
            fixedWidthButton,
            expandedButton,
            buttonBarDemo,
          ],
        ),
      ),
    );
  }
}
