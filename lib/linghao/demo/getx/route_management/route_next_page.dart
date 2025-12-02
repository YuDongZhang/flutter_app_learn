import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 路由跳转的目标页面
class RouteNextPage extends StatelessWidget {
  const RouteNextPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 Get.arguments 获取传递过来的参数
    final arguments = Get.arguments as Map<String, String>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('下一页 (Next Page)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '这是跳转后的页面',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              '接收到的参数: \n' 
              'id: ${arguments?['id'] ?? 'N/A'}\n' 
              'user: ${arguments?['user'] ?? 'N/A'}' ,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // 使用 Get.back() 返回，并可以传递一个结果
                Get.back(result: 'Hello from NextPage!');
              },
              child: const Text('返回上一页并传递结果'),
            ),
          ],
        ),
      ),
    );
  }
}
