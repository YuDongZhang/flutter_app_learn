import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'di_service.dart';

/// 依赖注入控制器示例
class DIController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    debugPrint('DIController onInit: 控制器已被创建！');
  }

  void increment() {
    count.value++;
    // 使用 Get.find() 获取已注册的服务
    final service = Get.find<DIService>();
    service.doSomething();
  }

  @override
  void onClose() {
    debugPrint('DIController onClose: 控制器已被销毁！');
    super.onClose();
  }
}
