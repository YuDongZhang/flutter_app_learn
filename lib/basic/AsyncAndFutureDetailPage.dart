import 'dart:math';

import 'package:flutter/material.dart';

class AsyncAndFutureDetailPage extends StatelessWidget {
  const AsyncAndFutureDetailPage({super.key});

  get value => null;

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: 'Future 基本概念',
        explanation: 'Future 表示一个可能还未完成的异步操作结果。常用于网络请求、IO 等耗时任务。',
        code: '''
Future<int> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  return 42;
}
''',
      ),
      _KnowledgePoint(
        title: 'async/await 语法',
        explanation: 'async 修饰函数，await 等待异步结果，代码更直观易读。',
        code: '''
Future<void> main() async {
  int result = await fetchData();
  print(result);
}
''',
      ),
      _KnowledgePoint(
        title: 'then/catchError/whenComplete 链式调用',
        explanation: 'Future 支持 then、catchError、whenComplete 方法链式处理结果、异常和收尾逻辑。',
        code: '''
fetchData()
  .then((value) => print('结果: $value'))
  .catchError((e) => print('异常: $e'))
  .whenComplete(() => print('完成'));
''',
      ),
      _KnowledgePoint(
        title: 'Future.error 和异常捕获',
        explanation: 'Future.error 可主动抛出异步异常，catchError 捕获。',
        code: '''
Future<int> errorFuture() => Future.error('出错了');

errorFuture().catchError((e) => print(e));
''',
      ),
      _KnowledgePoint(
        title: '微任务与事件队列',
        explanation: 'Dart 事件循环分为微任务队列（microtask）和事件队列（event queue），微任务优先执行。',
        code: '''
scheduleMicrotask(() => print('microtask'));
Future(() => print('event'));
print('main');
// 输出顺序：main -> microtask -> event
''',
      ),
      _KnowledgePoint(
        title: 'Future.wait 并发等待',
        explanation: 'Future.wait 可同时等待多个 Future 完成，适合并发任务。',
        code: '''
Future.wait([
  fetchData(),
  fetchData(),
]).then((results) => print(results));
''',
      ),
      _KnowledgePoint(
        title: '常见异步陷阱',
        explanation: '如未 await 导致未执行、异常未捕获等，需注意异步代码的正确性。',
        code: '''
Future<void> foo() async {
  throw Exception('error');
}
foo(); // 异常未捕获，建议加 await 或 catchError
''',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('异步与 Future 详解')),
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
                    Text('本页系统梳理 Dart 异步与 Future 相关知识点。每个知识点包含简明讲解和示例代码，建议：'),
                    SizedBox(height: 4),
                    Text('1. 先理解 Future、async/await 的基本用法；'),
                    Text('2. 结合示例代码，掌握链式调用、异常捕获、并发等高级用法；'),
                    Text('3. 注意微任务与事件队列的执行顺序，避免异步陷阱。'),
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