import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CounterController.dart';


class GetxPage extends StatelessWidget {
  const GetxPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 Get.put() 来实例化你的控制器，或者使用 Get.find() 来找到一个已经存在的控制器
    final CounterController c = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: const Text("GetX 计数器示例")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('你已经点击了按钮这么多次:'),
            // 使用 Obx() 组件来包裹需要响应数据变化的 Widget
            // 当 c.count 的值改变时，这个 Text 会自动重建
            Obx(() => Text(
                  "${c.count.value}",
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.increment, // 点击时调用控制器的方法
        child: const Icon(Icons.add),
      ),
    );
  }
}
