import 'package:flutter/material.dart';

class PerformanceOptimizeExplain {
  final String title;
  final String description;
  final String example;

  PerformanceOptimizeExplain({
    required this.title,
    required this.description,
    required this.example,
  });
}

// 示例数据
final List<PerformanceOptimizeExplain> performanceOptimizeList = [
  PerformanceOptimizeExplain(
    title: '避免不必要的重建',
    description: '使用 const 构造函数、合理拆分组件，减少 widget 重建次数。',
    example: 'const MyWidget(); // 使用 const 构造函数可以提升性能',
  ),
  PerformanceOptimizeExplain(
    title: '使用 ListView.builder',
    description: '长列表建议使用 ListView.builder，按需构建子项，节省内存。',
    example: '''ListView.builder(
  itemCount: 1000,
  itemBuilder: (context, index) => Text("Item $index"),
)''',
  ),
  PerformanceOptimizeExplain(
    title: '图片缓存与压缩',
    description: '加载图片时可使用缓存、压缩图片，减少内存占用和加载时间。',
    example: 'Image.network(url, cacheWidth: 200, cacheHeight: 200)',
  ),
  PerformanceOptimizeExplain(
    title: '使用 Flutter DevTools',
    description: '利用 DevTools 进行性能分析，定位性能瓶颈。',
    example: 'flutter pub global run devtools',
  ),
];

mixin index {
}

class PerformanceOptimizePage extends StatelessWidget {
  const PerformanceOptimizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('性能优化讲解'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: performanceOptimizeList.length,
        itemBuilder: (context, index) {
          final item = performanceOptimizeList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(item.description),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(8),
                    child: Text(item.example, style: const TextStyle(fontFamily: 'monospace')),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
} 