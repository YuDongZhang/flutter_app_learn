import 'package:flutter/material.dart';

class OperatorsDetailPage extends StatelessWidget {
  const OperatorsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: '后缀操作符 ?.（安全访问）',
        explanation: '用于安全访问对象成员，左侧对象为 null 时返回 null，否则返回成员值。',
        code: '''
String? a;
print(a?.length); // null
''',
      ),
      _KnowledgePoint(
        title: '取商操作符 ~/',
        explanation: '用于整数除法，返回整数商。',
        code: '''
print(2 / 3);   // 0.666...
print(2 ~/ 3);  // 0
''',
      ),
      _KnowledgePoint(
        title: '类型判定操作符 as、is、is!',
        explanation: 'as 用于类型转换，is/is! 用于类型判断。',
        code: '''
num iNum = 1;
print(iNum is int); // true
print(iNum is! double); // true
int i = iNum as int;
''',
      ),
      _KnowledgePoint(
        title: '条件表达式',
        explanation: 'Dart 支持三目运算符和 ??、??=。',
        code: '''
bool isFinish = true;
String txtVal = isFinish ? 'yes' : 'no';
bool? isPaused;
isPaused = isPaused ?? false;
// 或者
isPaused ??= false;
''',
      ),
      _KnowledgePoint(
        title: '级联操作符 ..',
        explanation: '可连续对同一对象调用多个方法或访问成员。',
        code: '''
StringBuffer sb = StringBuffer();
sb
  ..write('dongnao')
  ..write('flutter')
  ..writeln('damon');
''',
      ),
      _KnowledgePoint(
        title: '重载操作符',
        explanation: 'Dart 支持在类中重载运算符（如 +、-）。',
        code: '''
class Vector {
  final int x, y;
  const Vector(this.x, this.y);
  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
}
''',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('运算符详解')),
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