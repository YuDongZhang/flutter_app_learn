import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final String? title;
  const DetailPage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    // 接收参数
    final arguments = Get.arguments;
    final idParam = Get.parameters['id'];
    final sourceParam = Get.parameters['source'];

    return Scaffold(
      appBar: AppBar(title: Text(title ?? '详情页')),
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
            ],
          ),
        ),
      ),
    );
  }
}
