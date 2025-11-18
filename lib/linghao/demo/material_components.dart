import 'package:flutter/material.dart';
import 'package:flutter_app_learn/linghao/demo/popup_menu_button_demo.dart';
import 'package:flutter_app_learn/linghao/demo/radio_demo.dart';
import 'package:flutter_app_learn/linghao/demo/simple_dialog_demo.dart';
import 'package:flutter_app_learn/linghao/demo/slider_demo.dart';
import 'package:flutter_app_learn/linghao/demo/switch_demo.dart';

import 'Button_Demo.dart';
import 'alert_dialog_demo.dart';
import 'bottom_sheet_demo.dart';
import 'card_demo.dart';
import 'checkbox_demo.dart';
import 'chip_demo.dart';
import 'data_table_demo.dart';
import 'datetime_demo.dart';
import 'expansion_panel_demo.dart';
import 'floating_action_button_demo.dart';
import 'form_demo.dart';
import 'paginated_data_table_demo.dart';
import 'snack_bar_demo.dart';
import 'stepper_demo.dart';

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
          //CardDemo StepperDemo
          ListItem(title: 'StepperDemo 步进器', page: StepperDemo()),
          ListItem(title: 'CardDemo 卡片', page: CardDemo()),
          ListItem(title: 'PaginatedDataTableDemo 分页数据表', page: PaginatedDataTableDemo()),
          ListItem(title: 'DataTableDemo 数据表', page: DataTableDemo()),
          ListItem(title: 'ChipDemo 芯片标签', page: ChipDemo()),
          ListItem(title: 'ExpansionPanelDemo 展开面板', page: ExpansionPanelDemo()),
          ListItem(title: 'SnackBarDemo 消息栏', page: SnackBarDemo()),
          ListItem(title: 'BottomSheetDemo 底部弹窗', page: BottomSheetDemo()),
          ListItem(title: 'AlertDialogDemo 警告对话框', page: AlertDialogDemo()),
          ListItem(title: 'SimpleDialogDemo 简单对话框', page: SimpleDialogDemo()),
          ListItem(title: 'datetime 日期时间', page: DateTimeDemo()),
          ListItem(title: 'Slider 滑块', page: SliderDemo()),
          ListItem(title: 'switch 开关', page: SwitchDemo()),
          ListItem(title: 'radiobutton 单选按钮', page: RadioDemo()),
          ListItem(title: 'CheckBoxDemo 复选框', page: CheckboxDemo()),
          ListItem(title: 'form 表单', page: FormDemo()),
          ListItem(title: 'PopupMenuButton 弹出菜单按钮', page: PopupMenuButtonDemo()),
          ListItem(title: 'Button 按钮', page: ButtonDemo()),
          ListItem(
              title: 'FloatingActionButton 浮动操作按钮', page: FloatingActionButtonDemo()),
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

  ListItem({required this.title, required this.page});

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
