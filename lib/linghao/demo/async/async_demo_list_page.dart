import 'package:flutter/material.dart';
import 'package:flutter_app_learn/linghao/demo/async/StreamDemoPage.dart';
import 'MyAsync.dart';
import 'MyFutureBuilderWidget.dart';
import 'async_concept_page.dart';
import 'future_demo.dart';
import 'isolateDemo2.dart';

class AsyncDemoListPage extends StatelessWidget {
  const AsyncDemoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Demos'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Future Demo'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FutureDemo()),
            ),
          ),
          ListTile(
            title: const Text('异步的概念'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AsyncConceptPage()),
            ),
          ),
          ListTile(
            title: const Text('我的async'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyAsyncWidget()),
            ),
          ),
          ListTile(
            title: const Text('我的FutureBuilder'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyFutureBuilderWidget()),
            ),
          ),
          ListTile(
            title: const Text('我的stream'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => StreamDemoPage()),
            ),
          ),
          ListTile(
            title: const Text('isolate并发'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => JsonParseDemoPage()),
            ),
          ),
        ],
      ),
    );
  }
}
