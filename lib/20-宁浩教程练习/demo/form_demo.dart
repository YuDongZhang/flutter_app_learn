import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///单独设置的主题
      body: Theme(
        data: ThemeData(
          primaryColor: Colors.black,
        ),
        child: ThemeDemo(),
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //借用主页的主题
      color: Theme.of(context).accentColor,
    );
  }
}
