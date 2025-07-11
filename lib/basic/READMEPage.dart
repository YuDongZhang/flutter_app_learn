import 'package:flutter/material.dart';

class READMEPage extends StatelessWidget {
  const READMEPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_GuidePoint> points = [
      _GuidePoint(
        title: 'Dart 学习路线总览',
        explanation: '本项目内容涵盖 Dart 语言基础、进阶与高级知识，建议按如下顺序系统学习：\n1. 变量与类型\n2. 内置类型\n3. 函数\n4. 运算符\n5. 流程控制\n6. 异常处理\n7. 类与对象\n8. 混入与继承\n9. 泛型\n10. 库与包\n11. 异步与 Future\n12. Isolate\n13. 生成器',
      ),
      _GuidePoint(
        title: '学习建议',
        explanation: '1. 先通读每个知识点的讲解和示例代码，理解基本语法和用法。\n2. 多动手实践，尝试修改和运行示例代码，加深理解。\n3. 结合实际项目需求，灵活运用 Dart 的各项特性。\n4. 善用官方文档和社区资源，遇到疑问及时查阅。',
      ),
      _GuidePoint(
        title: '项目结构说明',
        explanation: '本项目按知识点模块化，每个模块有详细讲解、示例代码和部分互动练习。\n- 基础知识：变量、类型、函数、运算符、流程控制等\n- 进阶知识：类、继承、泛型、库与包等\n- 高级知识：异步、Isolate、生成器等',
      ),
      _GuidePoint(
        title: '高效学习技巧',
        explanation: '1. 以问题驱动学习，带着问题查找答案。\n2. 多做练习题和项目实战，理论结合实践。\n3. 总结归纳常用语法和易错点，形成自己的知识体系。',
      ),
      _GuidePoint(
        title: '推荐资源',
        explanation: '• Dart 官方文档：https://dart.dev/guides\n• Flutter 中文网：https://flutter.cn\n• Pub 包管理：https://pub.dev\n• DartPad 在线运行：https://dartpad.dev',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Dart 学习引导')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: points.length,
        itemBuilder: (context, index) {
          final item = points[index];
          return _GuideCard(item: item);
        },
      ),
    );
  }
}

class _GuidePoint {
  final String title;
  final String explanation;
  _GuidePoint({required this.title, required this.explanation});
}

class _GuideCard extends StatelessWidget {
  final _GuidePoint item;
  const _GuideCard({required this.item});

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
          ],
        ),
      ),
    );
  }
} 