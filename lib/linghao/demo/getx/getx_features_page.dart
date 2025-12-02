import 'package:flutter/material.dart';
import 'package:flutter_app_learn/linghao/demo/getx/features/dependency_injection_page.dart';
import 'package:flutter_app_learn/linghao/demo/getx/features/navigation_page.dart';
import 'package:flutter_app_learn/linghao/demo/getx/features/state_management_page.dart';
import 'package:flutter_app_learn/linghao/demo/getx/utils/utils_page.dart';

class GetxFeaturesPage extends StatelessWidget {
  const GetxFeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_FeatureItem> features = [
      _FeatureItem(
        '状态管理 (State Management)',
        '包括响应式变量 (.obs) 和控制器 (GetxController)',
        () => const StateManagementPage(),
      ),
      _FeatureItem(
        '依赖注入 (Dependency Injection)',
        '使用 Get.put(), Get.find(), Get.lazyPut() 等',
        () => const DependencyInjectionPage(),
      ),
      _FeatureItem(
        '路由管理 (Navigation)',
        '使用 Get.to(), Get.back(), Get.offAll() 等',
        () => const NavigationPage(),
      ),
      _FeatureItem(
        '工具类 (Utils)',
        '例如 Get.dialog(), Get.snackbar(), Get.bottomSheet()',
        () => const UtilsPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 功能示例'),
      ),
      body: ListView.separated(
        itemCount: features.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final feature = features[index];
          return ListTile(
            title: Text(feature.title),
            subtitle: Text(feature.subtitle),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => feature.page()),
              );
            },
          );
        },
      ),
    );
  }
}

class _FeatureItem {
  final String title;
  final String subtitle;
  final Widget Function() page;

  _FeatureItem(this.title, this.subtitle, this.page);
}