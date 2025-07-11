import 'package:flutter/material.dart';

class GeneratorsDetailPage extends StatelessWidget {
  const GeneratorsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: '生成器的基本概念',
        explanation: '生成器（Generator）用于按需生成数据流，节省内存。Dart 支持同步（sync*）和异步（async*）生成器。',
        code: '''
Iterable<int> syncGen() sync* {
  yield 1;
  yield 2;
}

Stream<int> asyncGen() async* {
  yield 1;
  yield 2;
}
''',
      ),
      _KnowledgePoint(
        title: '同步生成器（sync*）',
        explanation: 'sync* 返回 Iterable，适合同步数据流。yield 语句每次返回一个值，暂停函数执行。',
        code: '''
Iterable<int> getSyncGenerator(int n) sync* {
  int k = n;
  while (k > 0) {
    yield k--;
  }
}
''',
      ),
      _KnowledgePoint(
        title: '异步生成器（async*）',
        explanation: 'async* 返回 Stream，适合异步数据流。yield 语句每次推送一个值到流。',
        code: '''
Stream<int> getAsyncGenerator(int n) async* {
  int k = 0;
  while (k < n) {
    yield k++;
  }
}
''',
      ),
      _KnowledgePoint(
        title: '递归生成器（yield*）',
        explanation: 'yield* 可递归委托另一个生成器，简化递归数据流生成。',
        code: '''
Iterable<int> getSyncRecursiveGenerator(int n) sync* {
  if (n > 0) {
    yield n;
    yield* getSyncRecursiveGenerator(n - 1);
  }
}

Stream<int> getAsyncRecursiveGenerator(int n) async* {
  if (n > 0) {
    yield n;
    yield* getAsyncRecursiveGenerator(n - 1);
  }
}
''',
      ),
      _KnowledgePoint(
        title: '生成器的使用场景',
        explanation: '适合大数据量、流式处理、异步事件等场景，节省内存、提升效率。',
        code: '''
// 处理大文件、网络流、无限序列等
''',
      ),
      _KnowledgePoint(
        title: '生成器与普通函数区别',
        explanation: '生成器可中断和恢复执行，普通函数一次性返回所有结果。',
        code: '''
// 生成器：yield 每次返回一个值，暂停函数
// 普通函数：return 一次性返回所有结果
''',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('生成器详解')),
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
                    Text('本页系统梳理 Dart 生成器相关知识点。每个知识点包含简明讲解和示例代码，建议：'),
                    SizedBox(height: 4),
                    Text('1. 先理解 sync*、async*、yield、yield* 的基本用法；'),
                    Text('2. 结合示例代码，掌握同步/异步/递归生成器的实现；'),
                    Text('3. 理解生成器与普通函数的区别，合理选择数据处理方式。'),
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