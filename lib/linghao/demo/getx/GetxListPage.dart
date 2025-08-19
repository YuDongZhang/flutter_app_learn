import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'GetxPage.dart';
import 'MyService.dart';
import 'RouteManagementPage.dart';
import 'UtilsPage.dart';

class GetxFeaturesPage extends StatelessWidget {
  const GetxFeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 定义 GetX 功能列表
    final List<Map<String, dynamic>> features = [
      {
        'title': '状态管理 (State Management)',
        'subtitle': '响应式变量 (.obs) 和 Obx()',
        'page': () => const GetxPage(), // 链接到已有的计数器示例
      },
      {
        'title': '路由管理 (Route Management)',
        'subtitle': '使用 Get.to(), Get.back() 等进行导航',
        'page': () => const RouteManagementPage(),
      },
      {
        'title': '依赖注入 (Dependency Injection)',
        'subtitle': '使用 Get.put(), Get.find(), Get.lazyPut()',
        'page': () => const DependencyInjectionPage(),
      },
      {
        'title': '国际化 (Internationalization)',
        'subtitle': '轻松实现多语言切换',
        'page': () => const PlaceholderPage(title: '国际化示例'),
      },
      {
        'title': '工具类 (Utils)',
        'subtitle': '例如 Get.dialog(), Get.snackbar(), Get.bottomSheet()',
        'page': () => const UtilsPage(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 功能列表'),
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
              onTap: () => Get.to(feature['page']),
            ),
          );
        },
      ),
    );
  }
}

// 为未实现的功能创建一个简单的占位符页面
class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('此功能示例正在开发中...', style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}
