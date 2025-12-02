import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('路由管理')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildBasicNavigation(),
          _buildNamedNavigation(),
          _buildArgumentPassing(),
          _buildDataReturn(),
        ],
      ),
    );
  }

  Widget _buildBasicNavigation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('基础路由', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('无需 context 即可在任意地方导航。'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => Get.to(() => const _DetailPage(title: 'Get.to()')),
                  child: const Text('Get.to()'),
                ),
                ElevatedButton(
                  onPressed: () => Get.off(() => const _DetailPage(title: 'Get.off()')),
                  child: const Text('Get.off()'),
                ),
                ElevatedButton(
                  onPressed: () => Get.offAll(() => const _DetailPage(title: 'Get.offAll()')),
                  child: const Text('Get.offAll()'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Get.to():      跳转到新页面.\n' 
              'Get.off():     替换当前页面.\n' 
              'Get.offAll():  跳转并清空所有历史记录。',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNamedNavigation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('命名路由', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('需要在 GetMaterialApp 中预定义路由表。'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // 跳转到命名路由，同时传递参数
                Get.toNamed('/detail/123?source=named_route');
              },
              child: const Text("Get.toNamed('/detail/123')"),
            ),
            const SizedBox(height: 8),
            const Text(
              '命名路由使代码更清晰，易于管理。\n' 
              '你还可以在 URL 中传递参数。',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArgumentPassing() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('参数传递', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('向下一个页面传递任何类型的参数。'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => const _DetailPage(title: '参数传递'),
                  arguments: {
                    'id': 456,
                    'user': 'GetX User',
                    'isPremium': true,
                  },
                );
              },
              child: const Text('传递 Map 数据'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataReturn() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('页面返回数据', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('像 `async/await` 一样从页面获取返回值。'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                var result = await Get.to(() => const _ReturnDataPage());
                if (result != null) {
                  Get.snackbar('收到返回数据', '数据: $result');
                } else {
                  Get.snackbar('无返回数据', '用户直接返回或未选择数据');
                }
              },
              child: const Text('等待页面返回值'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- 用于导航的目标页面 ---

class _DetailPage extends StatelessWidget {
  final String title;
  const _DetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    // 接收参数
    final arguments = Get.arguments;
    final idParam = Get.parameters['id'];
    final sourceParam = Get.parameters['source'];

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (arguments != null)
                Text('收到的 arguments:\n$arguments', textAlign: TextAlign.center),
              if (idParam != null) Text('收到的 id (来自命名路由): $idParam'),
              if (sourceParam != null) Text('收到的 source: $sourceParam'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text('Get.back() 返回'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Get.to(() => const _DetailPage(title: '更深一层')),
                child: const Text('再进入一层'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReturnDataPage extends StatelessWidget {
  const _ReturnDataPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('选择并返回值')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // 返回数据
                Get.back(result: 'Success!');
              },
              child: const Text("返回 'Success!'"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back(result: 12345);
              },
              child: const Text('返回 12345'),
            ),
          ],
        ),
      ),
    );
  }
}
