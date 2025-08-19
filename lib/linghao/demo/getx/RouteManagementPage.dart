import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteManagementPage extends StatelessWidget {
  const RouteManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 路由管理'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // 简单页面跳转
                Get.to(() => const SecondPage());
              },
              child: const Text('Go to Second Page'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 返回上一页
                Get.back();
              },
              child: const Text('Go Back'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 使用命名路由跳转
                Get.toNamed('/third');
              },
              child: const Text('Go to Third Page (Named Route)'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text('This is the second page!'),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: const Center(
        child: Text('This is the third page, accessed via named route!'),
      ),
    );
  }
}
