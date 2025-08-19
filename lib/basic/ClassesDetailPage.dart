import 'package:flutter/material.dart';

class ClassesDetailPage extends StatelessWidget {
  const ClassesDetailPage({super.key});

  get a => null;

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: '类的定义与构造函数',
        explanation: 'Dart 使用 class 关键字定义类，构造函数与类同名，可简写。支持命名构造函数和重定向构造函数。',
        code: '''
class Point {
  num x, y;
  Point(this.x, this.y);
  Point.fromJson(Map json) {
    x = json['x'];
    y = json['y'];
  }
  Point.alongXAxis(num x) : this(x, 0);
}
''',
      ),
      _KnowledgePoint(
        title: '常量构造函数',
        explanation: '用 const 关键字定义常量构造函数，所有字段需为 final。',
        code: '''
class Point2 {
  final num x, y;
  const Point2(this.x, this.y);
}
const p = Point2(1, 2);
''',
      ),
      _KnowledgePoint(
        title: '工厂构造函数',
        explanation: 'factory 关键字可自定义实例化逻辑，常用于单例模式。',
        code: '''
class Singleton {
  static Singleton? _cache;
  factory Singleton() => _cache ??= Singleton._internal();
  Singleton._internal();
}
''',
      ),
      _KnowledgePoint(
        title: '继承与 super',
        explanation: 'Dart 支持单继承，子类用 extends 继承父类，super 访问父类成员。',
        code: '''
class Parent {
  int x;
  Parent(this.x);
}
class Child extends Parent {
  Child(int x) : super(x);
}
''',
      ),
      _KnowledgePoint(
        title: '实现接口 implements',
        explanation: 'Dart 没有 interface 关键字，类默认就是接口，实现接口用 implements。',
        code: '''
class People {
  void work() => print('people work');
}
class Jishi implements People {
  @override
  void work() => print('jishi work');
}
''',
      ),
      _KnowledgePoint(
        title: '可调用类',
        explanation: '实现 call 方法的类实例可像函数一样调用。',
        code: '''
class ClassFunction {
  call(String a, String b) => '$a $a!';
}
var cf = ClassFunction();
print(cf('hello', 'world'));
'''
      ),
      _KnowledgePoint(
        title: '操作符重载',
        explanation: 'Dart 支持在类中重载运算符（如 +、-）。',
        code: '''
class Vector {
  final int x, y;
  const Vector(this.x, this.y);
  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
}
''',
      ),
      _KnowledgePoint(
        title: 'getter 和 setter',
        explanation: '可用 get/set 关键字自定义属性的 getter/setter。',
        code: '''
class Rectangle {
  num left, top, width, height;
  Rectangle(this.left, this.top, this.width, this.height);
  num get right => left + width;
  set right(num value) => left = value - width;
}
''',
      ),
      _KnowledgePoint(
        title: '抽象类',
        explanation: '用 abstract 关键字定义抽象类，不能被实例化，只能被继承。',
        code: '''
abstract class Animal {
  void eat();
}
class Dog extends Animal {
  @override
  void eat() => print('Dog eat');
}
''',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('类与对象详解')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: points.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Card(
              color: Colors.blue[50],
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('学习引导', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                    SizedBox(height: 8),
                    Text('本页系统梳理 Dart 类与对象相关知识点。每个知识点包含简明讲解和示例代码，建议：'),
                    SizedBox(height: 4),
                    Text('1. 先阅读每个知识点的讲解，理解其用途和语法；'),
                    Text('2. 结合示例代码，尝试在本地运行和修改；'),
                    Text('3. 对比各类构造、继承、接口等用法，掌握面向对象编程思想。'),
                    SizedBox(height: 4),
                    Text('如有不懂，可结合官方文档或实际项目多练习。', style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            );
          }
          final item = points[index - 1];
          return _KnowledgeCard(item: item);
        },
      ),
    );
  }
}

class _KnowledgePoint {
  final String title;
  final String explanation;
  final String code;
  _KnowledgePoint({required this.title, required this.explanation, required this.code});
}

class _KnowledgeCard extends StatelessWidget {
  final _KnowledgePoint item;
  const _KnowledgeCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(item.explanation),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: const EdgeInsets.all(8),
              child: Text(item.code, style: const TextStyle(fontFamily: 'monospace')),
            ),
          ],
        ),
      ),
    );
  }
} 