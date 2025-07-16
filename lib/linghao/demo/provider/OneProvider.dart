import 'package:flutter/material.dart';

class OneProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter; // 提供 getter 方法访问计数器值

  void incrementCounter() {
    _counter++;
    notifyListeners(); // 通知监听器更新 UI
  }
}