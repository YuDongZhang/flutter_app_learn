import 'package:flutter/material.dart';

class LibrariesAndPackagesDetailPage extends StatelessWidget {
  const LibrariesAndPackagesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: 'Dart 核心库导入',
        explanation: 'Dart 提供丰富的核心库，如 dart:core、dart:math、dart:async 等，直接 import 即可使用。',
        code: '''
import 'dart:math';
import 'dart:async';
''',
      ),
      _KnowledgePoint(
        title: '第三方包导入',
        explanation: '通过 pub 包管理工具，可在 pubspec.yaml 添加依赖，import 包名即可使用。',
        code: '''
// pubspec.yaml
// dependencies:
//   dio: ^4.0.0

import 'package:dio/dio.dart';
''',
      ),
      _KnowledgePoint(
        title: '自定义库的导入',
        explanation: '可将自己的 Dart 文件作为库导入，支持 as、show、hide 等限定符。',
        code: '''
import 'mylib1.dart' as lib1;
import 'mylib2.dart' as lib2 show Test;
import 'mylib2.dart' hide Test;
''',
      ),
      _KnowledgePoint(
        title: '延迟加载（deferred as）',
        explanation: 'deferred as 可实现库的延迟加载，提升启动速度，适合不常用或较大库。',
        code: '''
import 'mylib1.dart' deferred as lazyLib;
// 使用前需 loadLibrary()
await lazyLib.loadLibrary();
lazyLib.someFunction();
''',
      ),
      _KnowledgePoint(
        title: '库的结构与组织',
        explanation: 'Dart 支持将相关功能拆分为多个文件，通过 export 统一对外暴露接口。',
        code: '''
// lib/mylib.dart
export 'src/a.dart';
export 'src/b.dart';
''',
      ),
      _KnowledgePoint(
        title: '包管理与 pub 工具',
        explanation: 'pub 是 Dart 的包管理工具，支持依赖管理、打包、发布等。',
        code: '''
// 添加依赖
pub add http
// 获取依赖
pub get
// 发布包
pub publish
''',
      ),
      _KnowledgePoint(
        title: '常见第三方包',
        explanation: '如 dio（网络）、provider（状态管理）、intl（国际化）、shared_preferences（本地存储）等。',
        code: '''
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
''',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('库与包详解')),
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
                    Text('本页系统梳理 Dart 库与包相关知识点。每个知识点包含简明讲解和示例代码，建议：'),
                    SizedBox(height: 4),
                    Text('1. 熟悉 Dart 核心库和常用第三方包的导入方式；'),
                    Text('2. 理解自定义库的组织与延迟加载；'),
                    Text('3. 掌握 pub 工具的依赖管理和包发布流程。'),
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