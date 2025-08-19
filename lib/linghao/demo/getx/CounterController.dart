import 'package:get/get.dart';

class CounterController extends GetxController {
  // 使用 .obs 将变量变为一个 "可观察的" 响应式变量
  final count = 0.obs;

  // 增加计数的方法
  void increment() {
    count.value++;
  }
}
