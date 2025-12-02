import 'package:flutter/material.dart';

/// Get.offAll() 跳转的目标页面
class RouteHomePage extends StatelessWidget {
  const RouteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('主页 (Home Page)'),
        // Get.offAll 会清除所有路由，所以这里没有返回按钮
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          '这是主页\n路由栈已被清空',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
