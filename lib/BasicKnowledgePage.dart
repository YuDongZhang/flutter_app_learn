import 'package:flutter/material.dart';
import 'basic/VariablesDetailPage.dart';
import 'basic/BuiltInTypesDetailPage.dart';
import 'basic/FunctionsDetailPage.dart';
import 'basic/OperatorsDetailPage.dart';
import 'basic/ControlFlowDetailPage.dart';
import 'basic/ExceptionDetailPage.dart';
import 'basic/ClassesDetailPage.dart';
import 'basic/MixinsAndInheritanceDetailPage.dart';
import 'basic/GenericsDetailPage.dart';
import 'basic/LibrariesAndPackagesDetailPage.dart';
import 'basic/AsyncAndFutureDetailPage.dart';
import 'basic/IsolateDetailPage.dart';
import 'basic/GeneratorsDetailPage.dart';

class BasicKnowledgePage extends StatelessWidget {
  const BasicKnowledgePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> knowledgePoints = [
      '变量与类型',
      '内置类型',
      '函数',
      '运算符',
      '流程控制',
      '异常处理',
      '类与对象',
      '混入与继承',
      '泛型',
      '库与包',
      '异步与Future',
      'Isolate',
      '生成器',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础知识'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemCount: knowledgePoints.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            // 变量与类型，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VariablesDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          if (index == 1) {
            // 内置类型，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BuiltInTypesDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          if (index == 2) {
            // 函数，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FunctionsDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          if (index == 3) {
            // 运算符，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OperatorsDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          if (index == 4) {
            // 流程控制，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ControlFlowDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          if (index == 5) {
            // 异常处理，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExceptionDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          if (index == 6) {
            // 类与对象，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ClassesDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          if (index == 7) {
            // 混入与继承，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MixinsAndInheritanceDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          if (index == 8) {
            // 泛型，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GenericsDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          if (index == 9) {
            // 库与包，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LibrariesAndPackagesDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          if (index == 10) {
            // 异步与Future，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AsyncAndFutureDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          if (index == 11) {
            // Isolate，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IsolateDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          if (index == 12) {
            // 生成器，点击跳转
            return Card(
              child: ListTile(
                title: Text(
                  knowledgePoints[index],
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GeneratorsDetailPage(),
                    ),
                  );
                },
              ),
            );
          }
          return Card(
            child: ListTile(
              title: Text(
                knowledgePoints[index],
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
} 