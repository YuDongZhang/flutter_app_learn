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
          ListItem(title: 'StepperDemo', page: StepperDemo()),
          ListItem(title: 'CardDemo', page: CardDemo()),
          ListItem(title: 'PaginatedDataTableDemo', page: PaginatedDataTableDemo()),
          ListItem(title: 'DataTableDemo', page: DataTableDemo()),
          ListItem(title: 'ChipDemo', page: ChipDemo()),
          ListItem(title: 'ExpansionPanelDemo', page: ExpansionPanelDemo()),
          ListItem(title: 'SnackBarDemo', page: SnackBarDemo()),
          ListItem(title: 'BottomSheetDemo', page: BottomSheetDemo()),
          ListItem(title: 'AlertDialogDemo', page: AlertDialogDemo()),
          ListItem(title: 'SimpleDialogDemo', page: SimpleDialogDemo()),
          ListItem(title: 'datetime', page: DateTimeDemo()),
          ListItem(title: 'Slider', page: SliderDemo()),
          ListItem(title: 'switch', page: SwitchDemo()),
          ListItem(title: 'radiobutton', page: RadioDemo()),
          ListItem(title: 'CheckBoxDemo', page: CheckboxDemo()),
          ListItem(title: 'form', page: FormDemo()),
          ListItem(title: 'PopupMenuButton', page: PopupMenuButtonDemo()),
          ListItem(title: 'Button', page: ButtonDemo()),
          ListItem(
              title: 'FloatingActionButton', page: FloatingActionButtonDemo()),
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
