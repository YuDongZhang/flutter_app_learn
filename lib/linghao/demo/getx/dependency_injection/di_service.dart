import 'package:get/get.dart';
import 'package:flutter/material.dart';

/// GetxService 示例
/// GetxService 和 GetxController 类似，但它不会在不使用时被销毁。
/// 它被设计用于持久化的服务，如 API客户端、数据库连接等。
class DIService extends GetxService {
  @override
  void onInit() {
    super.onInit();
    debugPrint('DIService onInit: 服务已启动！');
  }

  void doSomething() {
    debugPrint('DIService is doing something...');
  }

  @override
  void onClose() {
    debugPrint('DIService onClose: 服务已被销毁！(通常在应用关闭时)');
    super.onClose();
  }
}
