import 'package:flutter/material.dart';

class ControlFlowDetailPage extends StatelessWidget {
  const ControlFlowDetailPage({super.key});

  get item => null;

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: 'forEach 循环',
        explanation: 'forEach 是集合的内置方法，遍历集合中的每个元素并执行回调函数。',
        code: '''
var collection = [0, 1, 2];
collection.forEach((item) => print('forEach: $item'));
''',
      ),
      _KnowledgePoint(
        title: 'for-in 循环',
        explanation: 'for-in 用于遍历集合中的每个元素，语法简洁。',
        code: '''
for (var item in collection) {
  print('for-in: $item');
}
''',
      ),
      _KnowledgePoint(
        title: '标准 for 循环',
        explanation: '标准 for 循环适合需要索引的场景。',
        code: '''
for (int i = 0; i < collection.length; i++) {
  print(collection[i]);
}
''',
      ),
      _KnowledgePoint(
        title: 'while 和 do-while 循环',
        explanation: 'while 先判断条件再执行，do-while 先执行再判断条件。',
        code: '''
int i = 0;
while (i < 3) {
  print(i);
  i++;
}

do {
  print(i);
  i++;
} while (i < 3);
''',
      ),
      _KnowledgePoint(
        title: 'if-else 条件语句',
        explanation: 'if-else 用于条件分支。',
        code: '''
if (a > 0) {
  print('a > 0');
} else {
  print('a <= 0');
}
''',
      ),
      _KnowledgePoint(
        title: 'switch-case 语句',
        explanation: 'switch-case 适合多分支选择，case 后可跟任意常量。',
        code: '''
switch (value) {
  case 1:
    print('value is 1');
    break;
  case 2:
    print('value is 2');
    break;
  default:
    print('other');
}
''',
      ),
      _KnowledgePoint(
        title: 'break 和 continue',
        explanation: 'break 跳出循环，continue 跳过本次循环。',
        code: '''
for (var i = 0; i < 5; i++) {
  if (i == 2) continue;
  if (i == 4) break;
  print(i);
}
''',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('流程控制详解')),
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
