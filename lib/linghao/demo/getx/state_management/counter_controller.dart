import 'package:get/get.dart';

/// 状态管理控制器示例
class CounterController extends GetxController {
  /// --- 响应式状态管理 ---
  /// 使用 .obs 将变量变为响应式 (Rx)
  final count1 = 0.obs;

  /// --- 简单状态管理 ---
  /// 普通变量
  int count2 = 0;

  /// 响应式变量的自增方法
  void increment1() {
    count1.value++;
  }

  /// 简单状态变量的自增方法
  /// 调用此方法后需要手动调用 update() 来更新UI
  void increment2() {
    count2++;
    update(); // 通知 GetBuilder 更新
  }
}
