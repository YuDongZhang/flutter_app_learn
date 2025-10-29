import 'package:flutter/material.dart';
import 'DesignPatternExplain.dart';
import 'HightKnowledgeExplain.dart';
import 'PerformanceOptimizeExplain.dart';
import 'PlatformChannelExplain.dart';
import 'PlatformChannelAdvancedExplain.dart';
import 'CustomRenderExplain.dart';
import 'AdvancedAnimationExplain.dart';

class HightKnowledgePage extends StatelessWidget {
  const HightKnowledgePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HightKnowledgeExplain> knowledgeList = [
      HightKnowledgeExplain(
        title: '设计模式',
        description: '常用的设计模式及其在Flutter中的应用。',
        example: '如单例、工厂、观察者等模式在实际项目中的用法。',
      ),
      HightKnowledgeExplain(
        title: '性能优化',
        description: 'Flutter应用的性能分析与优化技巧。',
        example: '使用Flutter DevTools进行性能分析，避免不必要的重建。',
      ),
      HightKnowledgeExplain(
        title: '平台通道',
        description: 'Flutter与原生平台通信的高级用法。',
        example: '通过MethodChannel与Android/iOS原生代码交互。',
      ),
      HightKnowledgeExplain(
        title: '平台通道二',
        description: 'Flutter与原生平台通信的高级用法。多种方式',
        example: '多种方式进行平台通道交互。方法的互相调用，数据的传递',
      ),
      HightKnowledgeExplain(
        title: '自定义渲染',
        description: '深入理解Flutter的渲染机制与自定义绘制。',
        example: '使用CustomPainter实现复杂图形。',
      ),
      HightKnowledgeExplain(
        title: '高级动画',
        description: '复杂动画的实现与性能考量。',
        example: '使用AnimationController和Tween实现连贯动画。',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('高级知识'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: knowledgeList.length,
        itemBuilder: (context, index) {
          final item = knowledgeList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () {
                if (item.title == '设计模式') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DesignPatternPage(),
                    ),
                  );
                } else if (item.title == '性能优化') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PerformanceOptimizePage(),
                    ),
                  );
                } else if (item.title == '平台通道') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlatformChannelPage(),
                    ),
                  );
                } else if (item.title == '自定义渲染') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomRenderPage(),
                    ),
                  );
                } else if (item.title == '高级动画') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdvancedAnimationPage(),
                    ),
                  );
                } else if (item.title == '平台通道二') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlatformChannelAdvancedPage(),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 8),
                    Text(item.description),
                    if (item.example != null && item.example!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        color: Colors.grey[200],
                        padding: const EdgeInsets.all(8),
                        child: Text(item.example!, style: const TextStyle(fontFamily: 'monospace')),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}