import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'route_home_page.dart';
import 'route_next_page.dart';

/// 路由管理示例页面
class RouteManagementPage extends StatelessWidget {
  RouteManagementPage({super.key});

  final RxString _resultFromNextPage = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由管理'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildGetToExample(),
              _buildGetBackExample(),
              _buildGetOffExample(),
              _buildGetOffAllExample(),
              _buildNamedRouteExample(),
              _buildInfoCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGetToExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.to() / Get.toNamed()',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('跳转到新页面，类似于 Navigator.push()。'),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Get.to(NextPage)'),
              onPressed: () async {
                // 使用 Get.to() 跳转并传递参数
                // 可以 await 接收返回的参数
                var result = await Get.to(
                  () => const RouteNextPage(),
                  arguments: {'id': '123', 'user': 'John'},
                );
                _resultFromNextPage.value =
                    result ?? '没有返回值';
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGetBackExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.back()',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('关闭当前页面，类似于 Navigator.pop()。可以返回一个结果。'),
            const SizedBox(height: 10),
            Obx(() => Text('从下一页返回的结果: ${_resultFromNextPage.value}')),
          ],
        ),
      ),
    );
  }

  Widget _buildGetOffExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.off()',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('跳转到新页面并替换当前页面。'),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Get.off(NextPage)'),
              onPressed: () {
                Get.off(() => const RouteNextPage());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGetOffAllExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Get.offAll()',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('跳转到新页面并移除之前的所有页面。常用于登录成功后进入主页。'),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Get.offAll(HomePage)'),
              onPressed: () {
                Get.offAll(() => const RouteHomePage());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNamedRouteExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('命名路由',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('使用预定义名称进行路由跳转，方便管理。'),
            const SizedBox(height: 10),
            const Text(
              '需要在 GetMaterialApp 中配置 getPages 列表。',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text("Get.toNamed('/next')"),
              onPressed: () {
                Get.snackbar('提示', '请先在 GetMaterialApp 中配置命名路由');
                // 示例代码 (需在 GetMaterialApp 配置):
                // Get.toNamed('/next', arguments: {'id': 'named-route'});
              },
            ),
          ],
        ),
      ),
    );
  }

   Widget _buildInfoCard() {
    return const Card(
      color: Colors.lightBlueAccent,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '提示: \n'
          '1. `Get.to()`: 进入下一页.\n'
          '2. `Get.back()`: 返回上一页.\n'
          '3. `Get.off()`: 替换当前页。\n'
          '4. `Get.offAll()`: 清空路由栈并进入新页面。',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
