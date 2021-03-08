import 'package:flutter/material.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/checkbox_demo.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/datetime_demo.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/form_demo.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/popup_menu_button_demo.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/radio_demo.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/slider_demo.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/switch_demo.dart';

import 'Button_Demo.dart';
import 'floating_action_button_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          ListItem(title: 'datetime', page: DateTimeDemo()),
          ListItem(title: 'Slider', page: SliderDemo()),
          ListItem(title: 'switch', page: SwitchDemo()),
          ListItem(title: 'radiobutton', page: RadioDemo()),
          ListItem(title: 'CheckBoxDemo', page: CheckboxDemo()),
          ListItem(title: 'form', page: FormDemo()),
          ListItem(title: 'PopupMenuButton', page: PopupMenuButtonDemo()),
          ListItem(title: 'Button', page: ButtonDemo()),
          ListItem(title: 'FloatingActionButton', page: FloatingActionButtonDemo()),
        ],
      ),
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
