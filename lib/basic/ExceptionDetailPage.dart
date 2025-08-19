import 'package:flutter/material.dart';

class ExceptionDetailPage extends StatelessWidget {
  const ExceptionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: '异常的抛出 throw',
        explanation: 'Dart 使用 throw 抛出异常，可以抛出 Exception、Error 或任意非 null 对象。',
        code: '''
throw Exception('格式异常');
throw NullThrownError();
throw '这是一个异常';
''',
      ),
      _KnowledgePoint(
        title: '异常的捕获 try-catch',
        explanation: 'try-catch 用于捕获异常，on 指定异常类型，catch 可获取异常对象和堆栈信息。',
        code: '''
try {
  throw NullThrownError();
} on OutOfMemoryError {
  print('没有内存了');
} on Error {
  print('Unknown error catched');
} on Exception catch (e) {
  print('Unknown exception catched');
} catch (e, s) {
  print(e);
  print(s);
}
''',
      ),
      _KnowledgePoint(
        title: 'rethrow 重新抛出异常',
        explanation: '在 catch 块中可以用 rethrow 继续抛出异常，让外层捕获。',
        code: '''
try {
  // ...
} catch (e) {
  rethrow;
}
''',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('异常处理详解')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: points.length,
        itemBuilder: (context, index) {
          final item = points[index];
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