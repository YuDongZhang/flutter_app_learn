import 'package:flutter/material.dart';

class MixinsAndInheritanceDetailPage extends StatelessWidget {
  const MixinsAndInheritanceDetailPage({super.key});

  get msg => null;

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: '继承（extends）',
        explanation: 'Dart 支持单继承，子类通过 extends 继承父类，继承父类的属性和方法。',
        code: '''
class Animal {
  void eat() => print('Animal eat');
}
class Dog extends Animal {
  @override
  void eat() => print('Dog eat');
}
''',
      ),
      _KnowledgePoint(
        title: '重写方法（@override）',
        explanation: '子类可以用 @override 重写父类的方法，实现多态。',
        code: '''
class Parent {
  void sayHello() => print('Hello from Parent');
}
class Child extends Parent {
  @override
  void sayHello() => print('Hello from Child');
}
''',
      ),
      _KnowledgePoint(
        title: '混入（mixin with）',
        explanation: 'Dart 支持 mixin 复用多个类的功能，使用 with 关键字。',
        code: '''
mixin Logger {
  void log(String msg) => print('LOG: $msg');
}
class Dog with Logger {
  void bark() {
    log('Dog is barking');
  }
}
''',
      ),
      _KnowledgePoint(
        title: '多重混入',
        explanation: '可以用 with 连接多个 mixin，后混入的优先级更高。',
        code: '''
mixin A {
  String message() => 'A';
}
mixin B {
  String message() => 'B';
}
class C with A, B {}
void main() {
  print(C().message()); // 输出 B
}
''',
      ),
      _KnowledgePoint(
        title: 'mixin 限制',
        explanation: 'mixin 不能有构造函数，不能直接实例化。可通过 on 关键字限制只能被特定类型混入。',
        code: '''
mixin Swimmer on Animal {
  void swim() => print('swimming');
}
class Fish extends Animal with Swimmer {}
''',
      ),
      _KnowledgePoint(
        title: '接口与多实现',
        explanation: 'Dart 类默认就是接口，可以 implements 多个类，实现多继承效果。',
        code: '''
class A {
  void a() => print('A');
}
class B {
  void b() => print('B');
}
class C implements A, B {
  @override
  void a() => print('C implements A');
  @override
  void b() => print('C implements B');
}
''',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('混入与继承详解')),
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
                    Text('本页系统梳理 Dart 混入与继承相关知识点。每个知识点包含简明讲解和示例代码，建议：'),
                    SizedBox(height: 4),
                    Text('1. 先理解继承和 mixin 的区别和联系；'),
                    Text('2. 结合示例代码，体会多重混入、接口实现等高级用法；'),
                    Text('3. 多练习组合、复用、扩展类的能力。'),
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