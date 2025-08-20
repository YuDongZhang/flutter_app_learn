import 'package:flutter/material.dart';
import 'package:flutter_app_learn/linghao/demo/dio/DioPage.dart';
import 'package:flutter_app_learn/linghao/demo/form_demo.dart';
import 'package:flutter_app_learn/linghao/demo/provider/OnePage.dart';
import 'package:provider/provider.dart';
import '../highttwo/AsyncAdvancedExplain.dart';
import '../highttwo/IsolateAdvancedExplain.dart';
import '../highttwo/StreamAdvancedExplain.dart';
import '../highttwo/ReflectionAdvancedExplain.dart';
import '../linghao/demo/animation/animation_demo.dart';
import '../linghao/demo/bloc/BlocDemo.dart';
import '../linghao/demo/bloc/CounterBlocDemo.dart';
import '../linghao/demo/bloc/CounterBlocDemo.dart' as counterBlocDemo;
import '../linghao/demo/getx/GetxListPage.dart';
import '../linghao/demo/http/HttpDemo.dart';
import '../linghao/demo/material_components.dart';
import '../linghao/demo/navigator_demo.dart';
import '../linghao/demo/provider/OneProvider.dart';
import '../linghao/demo/riverpod/RiverpodFeaturesPage.dart';
import '../linghao/demo/rxdart/rxdart_demo.dart';
import '../linghao/demo/stream/stream_demo.dart';

// 你需要根据实际路径导入下列页面
// import 'package:your_project/xxx.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_DemoItem> items = [
      _DemoItem('导航', PageNav(title: '你好')),
      _DemoItem('form', FormDemo()),
      _DemoItem('各种控件', MaterialComponents()),
      _DemoItem('stream', StreamDemo()),
      _DemoItem('rxdart', RxDartDemo()),
      _DemoItem('Bloc', BlocDemo()),
      _DemoItem(
        'provider',
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
          child: counterBlocDemo.CounterHome(),
        ),
      ), // 为 CounterHome 提供 CounterProvider
      _DemoItem('http', HttpDemo()),
      _DemoItem('Animation', AnimationDemo()),
      _DemoItem(
          'one',
          ChangeNotifierProvider(
            create: (_) => OneProvider(),
            child: const OnePage(),
          )),
      _DemoItem('dio 使用', DioPage()),
      _DemoItem('getx 使用', GetxFeaturesPage()),
      //学习 Riverpod
      _DemoItem('Riverpod 使用', const RiverpodFeaturesPage()),
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
