import 'package:flutter/material.dart';
import 'package:flutter_app_learn/advanced/TabDemoPage.dart';
import 'package:flutter_app_learn/advanced/TestDemoPage.dart';
import 'ButtonDemoPage.dart';
import 'TextDemoPage.dart';
import 'CardDemoPage.dart';
import 'CheckboxDemoPage.dart';
import 'SwitchDemoPage.dart';
import 'RadioDemoPage.dart';
import 'SliderDemoPage.dart';
import 'ChipDemoPage.dart';
import 'DataTableDemoPage.dart';
import 'DateTimeDemoPage.dart';
import 'DrawerDemoPage.dart';
import 'ExpansionPanelDemoPage.dart';
import 'FloatingActionButtonDemoPage.dart';
import 'FormDemoPage.dart';
import 'ListViewDemoPage.dart';
import 'LayoutDemoPage.dart';
import 'NavigatorDemoPage.dart';
import 'PaginatedDataTableDemoPage.dart';
import 'PopupMenuButtonDemoPage.dart';
import 'SliverDemoPage.dart';
import 'SimpleDialogDemoPage.dart';
import 'SnackBarDemoPage.dart';
import 'StepperDemoPage.dart';
import 'BottomSheetDemoPage.dart';
import 'PostShowDemoPage.dart';
import 'BasicWidgetDemoPage.dart';
import 'HelloDemoPage.dart';

class WidgetKnowledgePage extends StatelessWidget {
  const WidgetKnowledgePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_WidgetDemo> demos = [
      _WidgetDemo('Button 按钮', 'Button_Demo'),
      _WidgetDemo('基础控件', 'basic_demo'),
      _WidgetDemo('卡片 Card', 'card_demo'),
      _WidgetDemo('复选框 Checkbox', 'checkbox_demo'),
      _WidgetDemo('Chip 标签', 'chip_demo'),
      _WidgetDemo('数据表 DataTable', 'data_table_demo'),
      _WidgetDemo('日期时间 DateTime', 'datetime_demo'),
      _WidgetDemo('抽屉 Drawer', 'drawer-demo'),
      _WidgetDemo('展开面板 ExpansionPanel', 'expansion_panel_demo'),
      _WidgetDemo('浮动按钮 FloatingActionButton', 'floating_action_button_demo'),
      _WidgetDemo('表单 Form', 'form_demo'),
      _WidgetDemo('列表 ListView', 'listview-demo'),
      _WidgetDemo('布局 Layout', 'layout_demo'),
      _WidgetDemo('导航 Navigator', 'navigator_demo'),
      _WidgetDemo('分页表 PaginatedDataTable', 'paginated_data_table_demo'),
      _WidgetDemo('弹出菜单 PopupMenuButton', 'popup_menu_button_demo'),
      _WidgetDemo('单选框 Radio', 'radio_demo'),
      _WidgetDemo('Sliver', 'sliver_demo'),
      _WidgetDemo('滑块 Slider', 'slider_demo'),
      _WidgetDemo('简单对话框 SimpleDialog', 'simple_dialog_demo'),
      _WidgetDemo('Snackbar', 'snack_bar_demo'),
      _WidgetDemo('步进器 Stepper', 'stepper_demo'),
      _WidgetDemo('开关 Switch', 'switch_demo'),
      _WidgetDemo('Tab 视图', 'view_demo'),
      _WidgetDemo('测试 Test', 'test_demo'),
      _WidgetDemo('底部导航 BottomNavigationBar', 'bottom_navigation_bar_demo'),
      _WidgetDemo('底部弹窗 BottomSheet', 'bottom_sheet_demo'),
      _WidgetDemo('Hello Demo', 'hello-demo'),
      _WidgetDemo('卡片 PostShow', 'post_show'),
      // 可继续添加...
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('控件知识点列表')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: demos.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = demos[index];
          return ListTile(
            title: Text(item.title, style: const TextStyle(fontSize: 18)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              if (item.fileKey == 'Button_Demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ButtonDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'basic_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BasicWidgetDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'card_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CardDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'checkbox_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckboxDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'switch_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SwitchDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'radio_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RadioDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'slider_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SliderDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'chip_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChipDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'data_table_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataTableDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'datetime_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DateTimeDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'drawer-demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DrawerDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'expansion_panel_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExpansionPanelDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'floating_action_button_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FloatingActionButtonDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'form_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'listview-demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListViewDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'layout_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LayoutDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'navigator_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigatorDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'paginated_data_table_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaginatedDataTableDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'popup_menu_button_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PopupMenuButtonDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'sliver_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SliverDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'simple_dialog_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SimpleDialogDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'snack_bar_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SnackBarDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'stepper_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StepperDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'bottom_sheet_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomSheetDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'post_show') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostShowDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'test_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TestDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'view_demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabDemoPage(),
                  ),
                );
              } else if (item.fileKey == 'hello-demo') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelloDemoPage(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _DemoPlaceholderPage(title: item.title),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class _WidgetDemo {
  final String title;
  final String fileKey;

  _WidgetDemo(this.title, this.fileKey);
}

class _DemoPlaceholderPage extends StatelessWidget {
  final String title;

  const _DemoPlaceholderPage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('这里将展示 $title 的详细讲解', style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
