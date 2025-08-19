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

    final labelText = find.text('hello');

    //表示没有找到小部件
    // expect(labelText, findsNothing);

    //找到一个小部件
    // expect(labelText, findsOneWidget);

    expect(labelText, findsNWidgets(1));

    //找到一个包含0的控件
    final actionChipLabelText = find.text('0');
    expect(actionChipLabelText, findsOneWidget);

    final actionChip = find.byType(ActionChip);
    await tester.tap(actionChip); //点击
    await tester.pump(); //重建小部件

    //按了之后显示的值应该是 1
    final actionChipLabelTextAfter = find.text('1');
    expect(actionChipLabelTextAfter, findsOneWidget);
  });
}
