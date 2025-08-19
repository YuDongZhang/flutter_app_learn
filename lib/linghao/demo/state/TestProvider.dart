import 'package:flutter/material.dart';

class TestProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners(); // 通知监听者状态已更新
  }

  void decrement() {
    _counter--;
    notifyListeners(); // 通知监听者状态已更新
  }
}