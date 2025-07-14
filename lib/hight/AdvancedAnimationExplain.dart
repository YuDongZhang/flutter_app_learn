import 'package:flutter/material.dart';

class AdvancedAnimationExplain {
  final String title;
  final String description;
  final String code;
  final Widget example;

  AdvancedAnimationExplain({
    required this.title,
    required this.description,
    required this.code,
    required this.example,
  });
}

final List<AdvancedAnimationExplain> advancedAnimationList = [
  AdvancedAnimationExplain(
    title: '淡入淡出动画',
    description: '使用 AnimationController 和 Tween 实现一个简单的淡入淡出动画。',
    code: '''
class FadeDemo extends StatefulWidget {
  const FadeDemo({super.key});
  @override
  State<FadeDemo> createState() => _FadeDemoState();
}

class _FadeDemoState extends State<FadeDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: const FlutterLogo(size: 100),
    );
  }
}
    ''',
    example: const FadeDemo(),
  ),
];


class FadeDemo extends StatefulWidget {
  const FadeDemo({super.key});
  @override
  State<FadeDemo> createState() => _FadeDemoState();
}

class _FadeDemoState extends State<FadeDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: const FlutterLogo(size: 100),
    );
  }
}

class AdvancedAnimationPage extends StatelessWidget {
  const AdvancedAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('高级动画讲解'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: advancedAnimationList.length,
        itemBuilder: (context, index) {
          final item = advancedAnimationList[index];
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
                    child: Text(item.code, style: const TextStyle(fontFamily: 'monospace')),
                  ),
                  const SizedBox(height: 16),
                  const Text('动画实例：', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  item.example,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
} 