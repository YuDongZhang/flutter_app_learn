import 'package:flutter/material.dart';

class AdvancedKnowledgePage extends StatelessWidget {
  const AdvancedKnowledgePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_AdvancedPoint> points = [
      _AdvancedPoint(
        title: '异步编程进阶',
        explanation: '深入理解 Future、Stream、事件循环、微任务队列与事件队列的执行顺序，掌握复杂异步场景下的错误处理与性能优化。',
        code: '''
Future<void> main() async {
  scheduleMicrotask(() => print('microtask'));
  Future(() => print('event'));
  print('main');
}
// 输出顺序：main -> microtask -> event
''',
      ),
      _AdvancedPoint(
        title: '多线程与并发',
        explanation: 'Dart 的 Isolate 支持多核并发，适合 CPU 密集型任务。掌握 Isolate 的创建、通信、关闭与实际应用。',
        code: '''
import 'dart:isolate';
void heavyTask(_) {
  // ...
}
Isolate.spawn(heavyTask, null);
''',
      ),
      _AdvancedPoint(
        title: '泛型高级用法',
        explanation: '泛型约束、泛型方法、泛型工厂、类型推断与运行时类型擦除等高级特性。',
        code: '''
class Zoo<T extends Animal> {
  T animal;
  Zoo(this.animal);
}
''',
      ),
      _AdvancedPoint(
        title: '反射与元编程',
        explanation: 'Dart 支持反射（dart:mirrors），可动态获取类型信息、调用方法、访问属性。Flutter 中建议用代码生成替代反射。',
        code: '''
// import 'dart:mirrors';
// MirrorSystem mirrors = currentMirrorSystem();
''',
      ),
      _AdvancedPoint(
        title: '注解（Annotation）',
        explanation: 'Dart 支持自定义注解，可用于元数据标记、代码生成、依赖注入等场景。',
        code: '''
class MyAnnotation {
  final String desc;
  const MyAnnotation(this.desc);
}
@MyAnnotation('示例注解')
class MyClass {}
''',
      ),
      _AdvancedPoint(
        title: '代码生成与构建系统',
        explanation: 'Dart 支持 build_runner、source_gen 等工具自动生成代码，提升开发效率。',
        code: '''
// flutter pub run build_runner build
''',
      ),
      _AdvancedPoint(
        title: '包管理与依赖冲突解决',
        explanation: '深入理解 pubspec.yaml、依赖版本管理、冲突解决与包发布流程。',
        code: '''
# pubspec.yaml
# dependencies:
#   http: ^0.13.0
#   dio: ^4.0.0
''',
      ),
      _AdvancedPoint(
        title: 'Flutter 与平台集成',
        explanation: 'Dart/Flutter 可与原生平台（Android/iOS）集成，调用平台 API、实现插件开发。',
        code: '''
// MethodChannel、PlatformView、插件开发等
''',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('进阶知识')),
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
                    Text('本页系统梳理 Dart 进阶知识点。每个知识点包含简明讲解和示例代码，建议：'),
                    SizedBox(height: 4),
                    Text('1. 结合实际项目需求，深入理解异步、并发、泛型、反射等高级特性；'),
                    Text('2. 多实践代码生成、包管理、平台集成等进阶能力；'),
                    Text('3. 善用官方文档和社区资源，持续提升技术水平。'),
                    SizedBox(height: 4),
                    Text('如有不懂，可结合官方文档或实际项目多练习。', style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            );
          }
          final item = points[index - 1];
          return _AdvancedCard(item: item);
        },
      ),
    );
  }
}

class _AdvancedPoint {
  final String title;
  final String explanation;
  final String code;
  _AdvancedPoint({required this.title, required this.explanation, required this.code});
}

class _AdvancedCard extends StatelessWidget {
  final _AdvancedPoint item;
  const _AdvancedCard({required this.item});

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