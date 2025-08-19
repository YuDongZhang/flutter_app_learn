import 'package:flutter/material.dart';

// 设计模式数据类
class DesignPatternExplain {
  final String title;
  final String description;
  final String example;

  DesignPatternExplain({
    required this.title,
    required this.description,
    required this.example,
  });
}

// 示例数据
final List<DesignPatternExplain> designPatternList = [
  DesignPatternExplain(
    title: '单例模式',
    description: '单例模式保证一个类只有一个实例，并提供全局访问点。常用于全局配置、数据库连接等。',
    example: 'class Singleton {\n  static final Singleton _instance = Singleton._internal();\n  factory Singleton() => _instance;\n  Singleton._internal();\n}',
  ),
  DesignPatternExplain(
    title: '工厂模式',
    description: '工厂模式通过工厂方法创建对象，隐藏具体实现，便于扩展和维护。',
    example: 'abstract class Animal {}\nclass Dog extends Animal {}\nclass Cat extends Animal {}\nAnimal createAnimal(String type) {\n  if (type == "dog") return Dog();\n  return Cat();\n}',
  ),
  DesignPatternExplain(
    title: '观察者模式',
    description: '观察者模式用于对象间一对多的通知，常用于事件监听。',
    example: 'class Observer {\n  void update() => print("收到通知");\n}\nclass Subject {\n  List<Observer> observers = [];\n  void add(Observer o) => observers.add(o);\n  void notify() {\n    for (var o in observers) { o.update(); }\n  }\n}',
  ),
];

class DesignPatternPage extends StatelessWidget {
  const DesignPatternPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设计模式讲解'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: designPatternList.length,
        itemBuilder: (context, index) {
          final item = designPatternList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(item.description),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(8),
                    child: Text(item.example, style: const TextStyle(fontFamily: 'monospace')),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}




