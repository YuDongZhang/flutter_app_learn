import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dependency_injection/dependency_injection_page.dart';
import 'route_management/route_management_page.dart';
import 'state_management/state_management_page.dart';
import 'utils/utils_page.dart';

/// GetX 功能展示列表页面
class GetxListPage extends StatelessWidget {
  const GetxListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 定义功能列表
    final List<Map<String, dynamic>> features = [
      {
        'title': '状态管理 (State Management)',
        'subtitle': 'Obx, GetBuilder, GetxController',
        'page': () => StateManagementPage(),
      },
      {
        'title': '依赖注入 (Dependency Injection)',
        'subtitle': 'Get.put, Get.find, Get.lazyPut, GetxService',
        'page': () => DependencyInjectionPage(),
      },
      {
        'title': '路由管理 (Route Management)',
        'subtitle': 'Get.to, Get.off, Get.back, Get.toNamed',
        'page': () => RouteManagementPage(),
      },
      {
        'title': '工具类 (Utils)',
        'subtitle': 'Get.dialog, Get.snackbar, Get.bottomSheet',
        'page': () => const UtilsPage(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 用法学习'),
      ),
      body: ListView.builder(
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                feature['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
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