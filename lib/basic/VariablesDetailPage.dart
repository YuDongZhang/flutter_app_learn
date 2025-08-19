import 'package:flutter/material.dart';

class VariablesDetailPage extends StatelessWidget {
  const VariablesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: '变量声明与类型推断',
        explanation: 'Dart 变量可以用 var、dynamic、Object 声明。\n- var 有初始值时类型被锁定\n- dynamic 和 Object 声明的变量类型可变',
        code: """
var name = 'dart';
dynamic value = 123;
Object obj = 'hello';
""",
        quiz: _Quiz(
          question: '下列哪个变量声明后类型不能再改变？',
          options: ['var', 'dynamic', 'Object'],
          correctIndex: 0,
          explanation: 'var 有初始值时类型被锁定，dynamic/Object 可变。',
        ),
      ),
      _KnowledgePoint(
        title: 'final 和 const',
        explanation: 'final 和 const 都用于声明常量。\n- final 运行时常量，只能赋值一次\n- const 编译时常量，值不可变',
        code: """
final fVariable = 'dongnao';
const cVariable = 'dongnao';
""",
        quiz: _Quiz(
          question: 'final 和 const 的区别是？',
          options: ['final 是运行时常量', 'const 是编译时常量', '两者都可以多次赋值'],
          correctIndex: 0,
          explanation: 'final 是运行时常量，const 是编译时常量。',
        ),
      ),
      // 可继续添加更多知识点
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('变量与类型详解')),
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
  final _Quiz quiz;

  _KnowledgePoint({required this.title, required this.explanation, required this.code, required this.quiz});
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
            const SizedBox(height: 12),
            _QuizWidget(quiz: item.quiz),
          ],
        ),
      ),
    );
  }
}

class _Quiz {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  _Quiz({required this.question, required this.options, required this.correctIndex, required this.explanation});
}

class _QuizWidget extends StatefulWidget {
  final _Quiz quiz;

  const _QuizWidget({required this.quiz});

  @override
  State<_QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<_QuizWidget> {
  int? selected;
  bool showResult = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    Text('练习：${widget.quiz.question}', style: const TextStyle(fontWeight: FontWeight.bold)),
    ...List.generate(widget.quiz.options.length, (i) {
    return RadioListTile<int>(
    value: i,
    groupValue: selected,
    onChanged: showResult ? null : (v) => setState(() => selected = v),
    title: Text(widget.quiz.options[i]),
    );
    }),
    if (!showResult)
    ElevatedButton(
    onPressed: selected == null ? null : () => setState(() => showResult = true),
    child: const Text('提交'),
    ),
    if (showResult)
    Padding(
    padding: const EdgeInsets.only(top: 8),
    child: Text(
    selected == widget.quiz.correctIndex ? '回答正确！' : '回答错误。${widget.quiz.explanation}',
    style: TextStyle(
    color: selected == widget.quiz.correctIndex ? Colors.green : Colors.red,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ],
    );
  }
}
