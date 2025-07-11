import 'package:flutter/material.dart';

class FunctionsDetailPage extends StatelessWidget {
  const FunctionsDetailPage({super.key});

  get name => null;

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: '普通函数定义',
        explanation: 'Dart 中函数使用关键字 void/int/var 等声明返回类型，也可以省略返回类型。',
        code: '''
int add(int x, int y) {
  return x + y;
}

add(1, 2); // 3
''',
      ),
      _KnowledgePoint(
        title: '箭头函数',
        explanation: 'Dart 支持简洁的箭头函数（=>），适合单表达式返回。',
        code: '''
int add2(int x, int y) => x + y;
''',
      ),
      _KnowledgePoint(
        title: '可选命名参数',
        explanation: '用 {param1, param2} 声明可选命名参数，调用时用参数名指定。',
        code: '''
int add3({int x = 1, int y = 2, int z = 3}) {
  return x + y + z;
}
add3(x: 2, y: 3); // 2+3+3=8
''',
      ),
      _KnowledgePoint(
        title: '可选位置参数',
        explanation: '用 [param1, param2] 声明可选位置参数，调用时按顺序传递。',
        code: '''
int add4(int x, [int y = 2, int z = 3]) {
  return x + y + z;
}
add4(1); // 1+2+3=6
''',
      ),
      _KnowledgePoint(
        title: '匿名函数',
        explanation: 'Dart 支持将函数赋值给变量，或作为参数传递。',
        code: '''
var anonFunc = (name) => 'I am $name';
print(anonFunc('damon'));
''',
      ),
      _KnowledgePoint(
        title: '闭包',
        explanation: '函数可以返回另一个函数，形成闭包，捕获外部变量。',
        code: '''
Function makeAddFunc(int x) {
  x++;
  return (int y) => x + y;
}
var addFunc = makeAddFunc(2);
print(addFunc(3)); // 6
''',
      ),
      _KnowledgePoint(
        title: '函数别名 typedef',
        explanation: 'typedef 可为函数类型定义别名，便于类型检查和传递。',
        code: '''
typedef MyFunc(int a, int b);
void calculator(int a, int b, MyFunc func) {
  func(a, b);
}
''',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('函数详解')),
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