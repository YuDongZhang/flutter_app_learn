import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 1. 创建一个服务类 (Service)
//    - 这个类模拟一个需要被注入的 "服务"，比如 API 客户端，数据库连接等。
class MyService {
  void doSomething() {
    print("MyService is doing something!");
  }
}

// 2. 创建一个控制器 (Controller)，并注入服务
class MyController extends GetxController {
  // 使用 Get.find() 获取注入的服务
  final myService = Get.find<MyService>();

  void performAction() {
    // 调用服务的方法
    myService.doSomething();
    // 弹出一个 SnackBar
    Get.snackbar(
      '操作完成',
      '已调用 MyService 的 doSomething() 方法',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

// 1. MyService: 模拟一个你需要注入的服务。
// 2. MyController: ◦ 使用 Get.find<MyService>() 获取注入的服务实例。 ◦ performAction() 方法演示了如何使用注入的服务。
// 3. DependencyInjectionPage: ◦ 通过 Get.find<MyController>().performAction() 调用控制器方法。
// 4. main.dart: ◦ 使用 Get.put(MyService()) 注册 MyService，使其成为全局可用的依赖。 ◦ 使用 Get.lazyPut(() => MyController())
// 注册 MyController。lazyPut 表示只有当 MyController 第一次被使用时，才会创建它的实例。
class DependencyInjectionPage extends StatelessWidget {
  const DependencyInjectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 3. 在页面中使用控制器
    //    - 注意：这里不需要手动创建控制器实例，GetX 会自动处理
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 依赖注入'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // 调用控制器的 performAction 方法
                Get.find<MyController>().performAction();
              },
              child: const Text('执行操作'),
            ),
          ],
        ),
      ),
    );
  }
}
