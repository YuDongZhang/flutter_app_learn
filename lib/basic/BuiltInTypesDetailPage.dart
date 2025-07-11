import 'package:flutter/material.dart';

class BuiltInTypesDetailPage extends StatelessWidget {
  const BuiltInTypesDetailPage({super.key});

  get name => null;

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: '数值类型（Numbers: int, double, num）',
        explanation: 'Dart 支持 int、double 两种数值类型，都是 num 的子类。\n- int：整数类型\n- double：64位双精度浮点数\n- num：int 和 double 的父类，可用于接收任意数值类型。',
        code: '''
int i = 1;
double d = 1.0;
num n1 = 1;
num n2 = 1.0;
''',
        quiz: _Quiz(
          question: '下列哪个类型既可以存储整数也可以存储浮点数？',
          options: ['int', 'double', 'num'],
          correctIndex: 2,
          explanation: 'num 是 int 和 double 的父类，可以存储任意数值类型。',
        ),
      ),
      _KnowledgePoint(
        title: '字符串类型（String）',
        explanation: 'Dart 字符串是 UTF-16 编码的字符序列，可以用单引号或双引号创建。\n- 支持字符串插值：\n  var name = "dart";\n  var s = "hello $name";\n- 支持多行字符串：三个单引号或双引号',
        code: '''
        var name = 'dart';
        var s = "hello $name";
        var multiLine = '多行\n字符串';
        ''',
        quiz: _Quiz(
          question: 'Dart 字符串插值的正确写法是？',
          options: ['var s = "hello name";', 'var s = "hello $name";', 'var s = "hello {name}";'],
          correctIndex: 1,
          explanation: 'Dart 字符串插值用 $name 或 ${name}。',
        ),
      ),
      _KnowledgePoint(
        title: '布尔类型（bool）',
        explanation: 'Dart 的 bool 类型只有 true 和 false 两个值。\n- 只能是 true/false，不能用 0/1 替代。',
        code: '''
bool isNull = false;
''',
        quiz: _Quiz(
          question: 'Dart 中 bool 类型的取值有哪些？',
          options: ['true/false', '0/1', '任意数字'],
          correctIndex: 0,
          explanation: 'Dart 的 bool 只能是 true 或 false。',
        ),
      ),
      _KnowledgePoint(
        title: '列表类型（List）',
        explanation: 'Dart 的 List 就是数组，支持 growable（可变长）和 fixed-length（定长）。\n- 可以存储任意类型元素，也可以指定类型。',
        code: '''
List growableList = [];
growableList.add(1);
growableList.add('dart');
List<int> intList = [1, 2, 3];
''',
        quiz: _Quiz(
          question: '如何声明一个只能存 int 的 List？',
          options: ['List<int> list = [];', 'List list = [];', 'var list = [];'],
          correctIndex: 0,
          explanation: 'List<int> list = []; 可声明只存 int 的列表。',
        ),
      ),
      _KnowledgePoint(
        title: '映射类型（Map）',
        explanation: 'Dart 的 Map 是键值对集合，key 和 value 可以是任意类型。',
        code: '''
var map = {'name': 'dart', 1: 'android'};
Map<int, String> map2 = {1: 'android', 2: 'flutter'};
''',
        quiz: _Quiz(
          question: 'Map<int, String> map = {...}，key 和 value 类型分别是什么？',
          options: ['int 和 String', 'String 和 int', '都可以任意类型'],
          correctIndex: 0,
          explanation: 'Map<int, String> 的 key 是 int，value 是 String。',
        ),
      ),
      _KnowledgePoint(
        title: '集合类型（Set）',
        explanation: 'Dart 的 Set 是无重复元素的集合。',
        code: '''
var set = {'dart', 'flutter'};
Set<int> intSet = {1, 2, 3};
''',
        quiz: _Quiz(
          question: 'Set 的最大特点是什么？',
          options: ['有序', '无重复元素', '可以有重复元素'],
          correctIndex: 1,
          explanation: 'Set 最大特点是无重复元素。',
        ),
      ),
      _KnowledgePoint(
        title: '符文（Runes）和符号（Symbol）',
        explanation: 'Runes 用于表示 Unicode 字符，Symbol 主要用于反射。',
        code: '''
String runesStr = '👄';
print(runesStr.runes.length); // 1
Symbol s = #mySymbol;
''',
        quiz: _Quiz(
          question: 'Runes 主要用于？',
          options: ['字符串插值', 'Unicode 字符表示', '类型判断'],
          correctIndex: 1,
          explanation: 'Runes 用于字符串中的 Unicode 字符表示。',
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('内置类型详解')),
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
              selected == widget.quiz.correctIndex ? '回答正确！' : '回答错误。\n${widget.quiz.explanation}',
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