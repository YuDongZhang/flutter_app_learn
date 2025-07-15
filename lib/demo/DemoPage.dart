import 'package:flutter/material.dart';
import '../highttwo/AsyncAdvancedExplain.dart';
import '../highttwo/IsolateAdvancedExplain.dart';
import '../highttwo/StreamAdvancedExplain.dart';
import '../highttwo/ReflectionAdvancedExplain.dart';
// 你需要根据实际路径导入下列页面
// import 'package:your_project/xxx.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  // 移植自 04-基础部件.dart
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const DemoPage(),
    '/about': (context) => PageNav(title: '你好'),
    '/form': (context) => FormDemo(),
    '/mdc': (context) => MaterialComponents(),
    '/state_manage': (context) => StateManagementDemo(),
    '/stream': (context) => StreamDemo(),
    '/rxdart': (context) => RxDartDemo(),
    '/Bloc': (context) => BlocDemo(),
    '/http': (context) => HttpDemo(),
    '/Animation': (context) => AnimationDemo(),
    '/I18nDemo': (context) => I18nDemo(),
    // 可继续添加新页面
  };

  @override
  Widget build(BuildContext context) {
    final List<_DemoItem> items = [
      _DemoItem('异步编程进阶', const AsyncAdvancedExplainPage()),
      _DemoItem('多线程与并发', const IsolateAdvancedExplainPage()),
      _DemoItem('Stream 讲解', const StreamAdvancedExplainPage()),
      _DemoItem('反射与元编程', const ReflectionAdvancedExplainPage()),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Demo 列表')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.title),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item.page),
              );
            },
          );
        },
      ),
    );
  }
}

class _DemoItem {
  final String title;
  final Widget page;
  _DemoItem(this.title, this.page);
}
