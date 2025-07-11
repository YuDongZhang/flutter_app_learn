import 'package:flutter/material.dart';

class GenericsDetailPage extends StatelessWidget {
  const GenericsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: '泛型的基本概念',
        explanation: '泛型（Generics）用于在类、接口和方法中定义可复用的类型参数，提升代码的灵活性和类型安全。',
        code: '''
List<String> names = ['Alice', 'Bob'];
Map<int, String> map = {1: 'A', 2: 'B'};
''',
      ),
      _KnowledgePoint(
        title: '泛型类',
        explanation: '自定义类时可通过 <T> 声明类型参数，实例化时指定具体类型。',
        code: '''
class Box<T> {
  T value;
  Box(this.value);
}
var box = Box<int>(123);
''',
      ),
      _KnowledgePoint(
        title: '泛型方法',
        explanation: '方法也可以声明泛型参数，调用时可自动推断或显式指定类型。',
        code: '''
T getFirst<T>(List<T> items) {
  return items[0];
}
var first = getFirst<String>(['a', 'b']);
''',
      ),
      _KnowledgePoint(
        title: '泛型约束',
        explanation: '通过 extends 关键字限制泛型类型参数的上界，只能传递特定类型或其子类。',
        code: '''
class Animal {}
class Dog extends Animal {}
class Zoo<T extends Animal> {
  T animal;
  Zoo(this.animal);
}
var zoo = Zoo(Dog());
''',
      ),
      _KnowledgePoint(
        title: '泛型的运行时类型',
        explanation: 'Dart 泛型在运行时类型会被擦除，但可用 is 判断 List<String> 等类型。',
        code: '''
var names = <String>[];
print(names is List<String>); // true
print(names.runtimeType); // List<String>
''',
      ),
      _KnowledgePoint(
        title: '泛型工厂构造函数',
        explanation: '泛型类可定义工厂构造函数，结合泛型参数灵活创建对象。',
        code: '''
class Factory<T> {
  factory Factory(T value) => _FactoryImpl(value);
}
class _FactoryImpl<T> implements Factory<T> {
  final T value;
  _FactoryImpl(this.value);
}
''',
      ),
      _KnowledgePoint(
        title: '泛型与类型推断',
        explanation: 'Dart 支持类型推断，通常可省略泛型参数，编译器自动推断类型。',
        code: '''
var list = <int>[];
list.add(1);
''',
      ),
      _KnowledgePoint(
        title: '泛型的局限性',
        explanation: 'Dart 泛型为伪泛型，运行时类型擦除，不能创建泛型类型的实例数组等。',
        code: '''
// 错误：var list = List<T>(); // 不能直接创建泛型类型的实例
''',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('泛型详解')),
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
                    Text('本页系统梳理 Dart 泛型相关知识点。每个知识点包含简明讲解和示例代码，建议：'),
                    SizedBox(height: 4),
                    Text('1. 先理解泛型的基本语法和用途；'),
                    Text('2. 结合示例代码，体会泛型类、方法、约束等高级用法；'),
                    Text('3. 注意泛型的运行时局限性，避免常见误区。'),
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