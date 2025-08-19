import 'package:flutter/material.dart';

class CustomRenderExplain {
  final String title;
  final String description;
  final String code;
  final Widget example;

  CustomRenderExplain({
    required this.title,
    required this.description,
    required this.code,
    required this.example,
  });
}

final List<CustomRenderExplain> customRenderList = [
  CustomRenderExplain(
    title: '绘制一个蓝色圆形',
    description: '通过 CustomPainter 实现自定义圆形绘制。',
    code: '''
class MyCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawCircle(size.center(Offset.zero), 50, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// 使用方法：
CustomPaint(
  size: Size(120, 120),
  painter: MyCirclePainter(),
)
    ''',
    example: Center(
      child: CustomPaint(
        size: const Size(120, 120),
        painter: _MyCirclePainter(),
      ),
    ),
  ),
];

class _MyCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawCircle(size.center(Offset.zero), 50, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CustomRenderPage extends StatelessWidget {
  const CustomRenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自定义渲染讲解'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '自定义渲染（CustomPainter）',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text('Flutter 支持通过 CustomPainter 进行自定义绘制，可以实现各种复杂的图形、动画和效果。'),
          const SizedBox(height: 16),
          const Text('常见用途：', style: TextStyle(fontWeight: FontWeight.bold)),
          const Text('• 绘制自定义图形（如波浪、仪表盘、进度环等）'),
          const Text('• 实现特殊的动画效果'),
          const Text('• 可视化数据等'),
          const SizedBox(height: 16),
          const Text('示例：绘制一个简单的圆', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
class MyCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawCircle(size.center(Offset.zero), 50, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// 使用方法：
CustomPaint(
  size: Size(120, 120),
  painter: MyCirclePainter(),
)
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          const Text('更多内容可参考官方文档：'),
          const Text('https://docs.flutter.dev/ui/advanced/custom-painting', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
} 