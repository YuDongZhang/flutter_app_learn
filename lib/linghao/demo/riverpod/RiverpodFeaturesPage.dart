import 'package:flutter/material.dart';
import 'package:flutter_app_learn/linghao/demo/riverpod/provider_page.dart';

import '../getx/GetxListPage.dart';
import 'CounterPage.dart';
import 'FutureProviderPage.dart';
import 'NotifierProviderPage.dart';
import 'StreamProviderPage.dart';

class RiverpodFeaturesPage extends StatelessWidget {
  const RiverpodFeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 定义 Riverpod 功能列表
    final List<Map<String, dynamic>> features = [
      {
        'title': 'StateProvider',
        'subtitle': '用于简单的可变状态，如计数器、布尔值等',
        'page': const CounterPage(),
      },
      {
        'title': 'Provider',
        'subtitle': '用于提供只读对象，如服务或仓库',
        'page': const ProviderPage(),
      },
      {
        'title': 'FutureProvider',
        'subtitle': '用于处理异步操作（如网络请求）并提供其结果',
        'page': const FutureProviderPage(),
      },
      {
        'title': 'StreamProvider',
        'subtitle': '用于监听 Stream 并提供其数据',
        'page': const StreamProviderPage(),
      },
      {
        'title': 'NotifierProvider',
        'subtitle': '用于更复杂的业务逻辑和状态',
        'page': const NotifierProviderPage(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod 功能列表'),
      ),
      body: ListView.builder(
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(feature['title']),
              subtitle: Text(feature['subtitle']),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => feature['page']),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
