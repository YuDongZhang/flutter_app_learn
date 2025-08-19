import 'package:flutter/material.dart';

class ReflectionAdvancedExplainPage extends StatelessWidget {
  const ReflectionAdvancedExplainPage({super.key});

  void _showExampleDialog(BuildContext context, Widget example, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: example,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('反射与元编程')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 反射基础
          Row(
            children: const [
              Chip(label: Text('反射基础', style: TextStyle(color: Colors.white)), backgroundColor: Colors.blue),
              SizedBox(width: 8),
              Text('动态获取类型信息'),
            ],
          ),
          const SizedBox(height: 8),
          const Text('反射允许在运行时动态获取和操作类型信息，如类名、方法、属性等。在 Flutter 中建议用代码生成替代反射。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
// 注意：dart:mirrors 在 Flutter 中不可用
// import 'dart:mirrors';

class MyClass {
  String name = 'test';
  void sayHello() => print('Hello');
}

// 反射示例（概念性）
// MirrorSystem mirrors = currentMirrorSystem();
// ClassMirror classMirror = mirrors.findLibrary('my_library').declarations['MyClass'];
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const Divider(height: 32),

          // 注解（Annotation）
          Row(
            children: const [
              Chip(label: Text('注解', style: TextStyle(color: Colors.white)), backgroundColor: Colors.green),
              SizedBox(width: 8),
              Text('元数据标记'),
            ],
          ),
          const SizedBox(height: 8),
          const Text('注解是元数据标记，可用于代码生成、依赖注入、验证等场景。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
class MyAnnotation {
  final String desc;
  const MyAnnotation(this.desc);
}

@MyAnnotation('这是一个测试类')
class TestClass {
  @MyAnnotation('这是一个方法')
  void testMethod() {}
}
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () => _showExampleDialog(context, const AnnotationDemoWidget(), '注解示例'),
              child: const Text('查看示例'),
            ),
          ),
          const Divider(height: 32),

          // 代码生成
          Row(
            children: const [
              Chip(label: Text('代码生成', style: TextStyle(color: Colors.white)), backgroundColor: Colors.orange),
              SizedBox(width: 8),
              Text('build_runner'),
            ],
          ),
          const SizedBox(height: 8),
          const Text('使用 build_runner 和 source_gen 自动生成代码，提升开发效率。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
# pubspec.yaml
dependencies:
  build_runner: ^2.4.0
  source_gen: ^1.5.0

# 运行代码生成
flutter pub run build_runner build
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const Divider(height: 32),

          // 实际应用
          Row(
            children: const [
              Chip(label: Text('实际应用', style: TextStyle(color: Colors.white)), backgroundColor: Colors.purple),
              SizedBox(width: 8),
              Text('常见使用场景'),
            ],
          ),
          const SizedBox(height: 8),
          const Text('• JSON 序列化：json_serializable\n• 依赖注入：get_it、injectable\n• 路由生成：auto_route\n• 状态管理：freezed、mobx\n• 数据库：drift、hive'),
        ],
      ),
    );
  }
}

// 注解示例
class AnnotationDemoWidget extends StatelessWidget {
  const AnnotationDemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('注解示例：'),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          color: Colors.grey[100],
          padding: const EdgeInsets.all(8),
          child: const Text(
            '''
@MyAnnotation('这是一个测试类')
class TestClass {
  @MyAnnotation('这是一个方法')
  void testMethod() {
    print('Hello from annotated method');
  }
}
            ''',
            style: TextStyle(fontFamily: 'monospace', fontSize: 12),
          ),
        ),
        const SizedBox(height: 8),
        const Text('注解可以用于：'),
        const Text('• 代码生成'),
        const Text('• 依赖注入'),
        const Text('• 验证规则'),
        const Text('• 文档标记'),
      ],
    );
  }
}

// 示例注解类
class MyAnnotation {
  final String desc;
  const MyAnnotation(this.desc);
}

@MyAnnotation('这是一个测试类')
class TestClass {
  @MyAnnotation('这是一个方法')
  void testMethod() {
    print('Hello from annotated method');
  }
} 