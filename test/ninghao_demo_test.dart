import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_learn/20-%E5%AE%81%E6%B5%A9%E6%95%99%E7%A8%8B%E7%BB%83%E4%B9%A0/demo/test_demo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return hello + something-', () {
    var str = NinghaoTestDemo.greet('ninghao');
    //断言
    expect(str, 'hello ninghao');
  });

  //也就是测试小部件在不在某个地方
  testWidgets('测试小部件', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TestDemo(),
    ));
  });
}
