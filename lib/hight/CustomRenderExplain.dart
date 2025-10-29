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
        title: const Text('自定义控件实现方法'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Flutter 自定义控件实现方法',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          const Text('Flutter 提供了多种方式来实现自定义控件，可以根据需求选择合适的方法。'),
          const SizedBox(height: 16),
          
          const Text('1. 自定义渲染（CustomPainter）', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('通过继承 CustomPainter 类实现自定义绘制，适合需要高度定制化视觉效果的情况。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
// 自定义绘制器
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

// 使用方法
CustomPaint(
  size: Size(120, 120),
  painter: MyCirclePainter(),
)
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('2. 组合现有控件（Composition）', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('通过组合现有的 Flutter 控件来创建新的自定义控件，这是最常用的方法。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
// 自定义按钮控件
class MyCustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  
  const MyCustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, color: Colors.white),
          SizedBox(width: 8),
          Text(text, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

// 使用方法
MyCustomButton(
  text: '添加项目',
  onPressed: () {},
)
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('3. 继承现有控件（Inheritance）', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('通过继承现有的控件类来扩展功能，适合需要修改现有控件行为的情况。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
// 自定义文本框
class MyTextField extends TextField {
  MyTextField({
    super.controller,
    super.decoration,
    super.keyboardType,
  }) : super(
    style: TextStyle(fontSize: 16),
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.all(12),
    ),
  );
  
  // 可以添加自定义方法
  void clearText() {
    controller?.clear();
  }
}

// 使用方法
MyTextField(
  controller: TextEditingController(),
  decoration: InputDecoration(labelText: '用户名'),
)
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('4. RenderObject 自定义渲染', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('通过直接操作 RenderObject 来实现最底层的自定义渲染，性能最高但复杂度也最高。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
// 自定义 RenderObject
class MyRenderBox extends RenderBox {
  @override
  void performLayout() {
    size = constraints.biggest;
  }
  
  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawRect(offset & size, paint);
  }
}

// 对应的 Widget
class MyRenderWidget extends LeafRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return MyRenderBox();
  }
}
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('5. 使用第三方库', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('利用现有的第三方库来快速实现复杂功能，如动画、图表、富文本等。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
// pubspec.yaml 添加依赖
dependencies:
  flutter_charts: ^1.0.0
  animated_text_kit: ^4.2.2

// 使用第三方图表库
LineChart(
  data: chartData,
  style: ChartStyle(),
)

// 使用动画文本库
AnimatedTextKit(
  animatedTexts: [
    TypewriterAnimatedText('Hello World!'),
  ],
)
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('6. 平台通道集成原生控件', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('通过平台通道集成 Android/iOS 的原生控件，实现 Flutter 无法直接提供的功能。'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8),
            child: const Text(
              '''
// Flutter 端
class NativeWebView extends StatelessWidget {
  final String url;
  
  const NativeWebView({required this.url});
  
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return AndroidView(
        viewType: 'webview',
        creationParams: {'url': url},
      );
    } else if (Platform.isIOS) {
      return UiKitView(
        viewType: 'webview',
        creationParams: {'url': url},
      );
    }
    return Text('平台不支持');
  }
}
              ''',
              style: TextStyle(fontFamily: 'monospace'),
            ),
          ),
          const SizedBox(height: 16),
          
          const Text('选择建议：', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('• 简单功能：优先使用组合现有控件\n• 复杂图形：使用 CustomPainter\n• 性能要求高：考虑 RenderObject\n• 快速开发：使用第三方库\n• 原生功能：使用平台通道'),
          const SizedBox(height: 16),
          
          const Text('更多内容可参考官方文档：'),
          const Text('https://docs.flutter.dev/ui/advanced/custom-painting', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}