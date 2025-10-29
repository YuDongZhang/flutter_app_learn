import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

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
    title: '1. 基础动画 - 淡入淡出',
    description: '使用 AnimationController 和 Tween 实现简单的淡入淡出动画，这是最基础的动画类型。',
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
  AdvancedAnimationExplain(
    title: '2. 缩放动画',
    description: '通过 ScaleTransition 实现缩放动画，可以控制控件的放大缩小效果。',
    code: '''
class ScaleDemo extends StatefulWidget {
  const ScaleDemo({super.key});
  @override
  State<ScaleDemo> createState() => _ScaleDemoState();
}

class _ScaleDemoState extends State<ScaleDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween(begin: 0.5, end: 1.5).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: const Center(child: Text('缩放', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
    ''',
    example: const ScaleDemo(),
  ),
  AdvancedAnimationExplain(
    title: '3. 旋转动画',
    description: '使用 RotationTransition 实现旋转动画，可以创建旋转效果。',
    code: '''
class RotationDemo extends StatefulWidget {
  const RotationDemo({super.key});
  @override
  State<RotationDemo> createState() => _RotationDemoState();
}

class _RotationDemoState extends State<RotationDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 2 * 3.14159).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: const Center(child: Text('旋转', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
    ''',
    example: const RotationDemo(),
  ),
  AdvancedAnimationExplain(
    title: '4. 平移动画',
    description: '通过 PositionedTransition 或 SlideTransition 实现控件的位置移动动画。',
    code: '''
class SlideDemo extends StatefulWidget {
  const SlideDemo({super.key});
  @override
  State<SlideDemo> createState() => _SlideDemoState();
}

class _SlideDemoState extends State<SlideDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(-0.5, 0.0),
      end: const Offset(0.5, 0.0),
    ).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
        child: const Center(child: Text('平移', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
    ''',
    example: const SlideDemo(),
  ),
  AdvancedAnimationExplain(
    title: '5. 组合动画',
    description: '将多个动画组合在一起，实现更复杂的动画效果。',
    code: '''
class CombinedDemo extends StatefulWidget {
  const CombinedDemo({super.key});
  @override
  State<CombinedDemo> createState() => _CombinedDemoState();
}

class _CombinedDemoState extends State<CombinedDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _scaleAnimation = Tween(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    _rotationAnimation = Tween(begin: 0.0, end: 2 * 3.14159).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.purple,
          child: const Center(child: Text('组合', style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}
    ''',
    example: const CombinedDemo(),
  ),
  AdvancedAnimationExplain(
    title: '6. 隐式动画',
    description: '使用 AnimatedContainer、AnimatedOpacity 等隐式动画组件，无需手动管理动画控制器。',
    code: '''
class ImplicitDemo extends StatefulWidget {
  const ImplicitDemo({super.key});
  @override
  State<ImplicitDemo> createState() => _ImplicitDemoState();
}

class _ImplicitDemoState extends State<ImplicitDemo> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: _expanded ? 200 : 100,
          height: _expanded ? 200 : 100,
          color: _expanded ? Colors.orange : Colors.blue,
          curve: Curves.easeInOut,
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _expanded ? 1.0 : 0.5,
              child: const Text('隐式动画', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Text(_expanded ? '缩小' : '放大'),
        ),
      ],
    );
  }
}
    ''',
    example: const ImplicitDemo(),
  ),
  AdvancedAnimationExplain(
    title: '7. 物理动画',
    description: '使用 SpringSimulation 或 GravitySimulation 实现基于物理的动画效果。',
    code: '''
class PhysicsDemo extends StatefulWidget {
  const PhysicsDemo({super.key});
  @override
  State<PhysicsDemo> createState() => _PhysicsDemoState();
}

class _PhysicsDemoState extends State<PhysicsDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
    
    final spring = SpringSimulation(
      SpringDescription(mass: 1, stiffness: 100, damping: 10),
      0.0,   // 起始位置
      300.0, // 目标位置
      100.0, // 初始速度
    );
    
    _animation = _controller.drive(
      Tween<double>(begin: 0, end: 300).animate(spring),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.animateWith(spring);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animation.value),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.teal,
                child: const Center(child: Text('物理', style: TextStyle(color: Colors.white))),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _startAnimation,
          child: const Text('开始物理动画'),
        ),
      ],
    );
  }
}
    ''',
    example: const PhysicsDemo(),
  ),
  AdvancedAnimationExplain(
    title: '8. 自定义动画曲线',
    description: '使用自定义的 Curve 类来创建独特的动画效果。',
    code: '''
class CustomCurveDemo extends StatefulWidget {
  const CustomCurveDemo({super.key});
  @override
  State<CustomCurveDemo> createState() => _CustomCurveDemoState();
}

class _CustomCurveDemoState extends State<CustomCurveDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    
    // 自定义曲线：先快后慢再快
    _animation = Tween(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: _CustomCurve(),
      ),
    );
    
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.brown,
            child: const Center(child: Text('曲线', style: TextStyle(color: Colors.white))),
          ),
        );
      },
    );
  }
}

// 自定义动画曲线
class _CustomCurve extends Curve {
  @override
  double transform(double t) {
    // 自定义曲线函数：先快后慢再快
    if (t < 0.3) {
      return t * 2; // 快速开始
    } else if (t < 0.7) {
      return 0.6 + (t - 0.3) * 0.2; // 慢速中间
    } else {
      return 0.68 + (t - 0.7) * 1.6; // 快速结束
    }
  }
}
    ''',
    example: const CustomCurveDemo(),
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

class ScaleDemo extends StatefulWidget {
  const ScaleDemo({super.key});
  @override
  State<ScaleDemo> createState() => _ScaleDemoState();
}

class _ScaleDemoState extends State<ScaleDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween(begin: 0.5, end: 1.5).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: const Center(child: Text('缩放', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}

class RotationDemo extends StatefulWidget {
  const RotationDemo({super.key});
  @override
  State<RotationDemo> createState() => _RotationDemoState();
}

class _RotationDemoState extends State<RotationDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 2 * 3.14159).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: const Center(child: Text('旋转', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}

class SlideDemo extends StatefulWidget {
  const SlideDemo({super.key});
  @override
  State<SlideDemo> createState() => _SlideDemoState();
}

class _SlideDemoState extends State<SlideDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(-0.5, 0.0),
      end: const Offset(0.5, 0.0),
    ).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
        child: const Center(child: Text('平移', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}

class CombinedDemo extends StatefulWidget {
  const CombinedDemo({super.key});
  @override
  State<CombinedDemo> createState() => _CombinedDemoState();
}

class _CombinedDemoState extends State<CombinedDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    _scaleAnimation = Tween(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    _rotationAnimation = Tween(begin: 0.0, end: 2 * 3.14159).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.purple,
          child: const Center(child: Text('组合', style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}

class ImplicitDemo extends StatefulWidget {
  const ImplicitDemo({super.key});
  @override
  State<ImplicitDemo> createState() => _ImplicitDemoState();
}

class _ImplicitDemoState extends State<ImplicitDemo> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: _expanded ? 200 : 100,
          height: _expanded ? 200 : 100,
          color: _expanded ? Colors.orange : Colors.blue,
          curve: Curves.easeInOut,
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: _expanded ? 1.0 : 0.5,
              child: const Text('隐式动画', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Text(_expanded ? '缩小' : '放大'),
        ),
      ],
    );
  }
}

class PhysicsDemo extends StatefulWidget {
  const PhysicsDemo({super.key});
  @override
  State<PhysicsDemo> createState() => _PhysicsDemoState();
}

class _PhysicsDemoState extends State<PhysicsDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  Simulation? get spring => null;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
    
    final spring = SpringSimulation(
      SpringDescription(mass: 1, stiffness: 100, damping: 10),
      0.0,   // 起始位置
      300.0, // 目标位置
      100.0, // 初始速度
    );
    
    _animation = _controller.drive(
      Tween<double>(begin: 0, end: 300).animate(spring as Animation<double>) as Animatable<double>,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.animateWith(spring!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animation.value),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.teal,
                child: const Center(child: Text('物理', style: TextStyle(color: Colors.white))),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _startAnimation,
          child: const Text('开始物理动画'),
        ),
      ],
    );
  }
}

class CustomCurveDemo extends StatefulWidget {
  const CustomCurveDemo({super.key});
  @override
  State<CustomCurveDemo> createState() => _CustomCurveDemoState();
}

class _CustomCurveDemoState extends State<CustomCurveDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    
    // 自定义曲线：先快后慢再快
    _animation = Tween(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: _CustomCurve(),
      ),
    );
    
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.brown,
            child: const Center(child: Text('曲线', style: TextStyle(color: Colors.white))),
          ),
        );
      },
    );
  }
}

// 自定义动画曲线
class _CustomCurve extends Curve {
  @override
  double transform(double t) {
    // 自定义曲线函数：先快后慢再快
    if (t < 0.3) {
      return t * 2; // 快速开始
    } else if (t < 0.7) {
      return 0.6 + (t - 0.3) * 0.2; // 慢速中间
    } else {
      return 0.68 + (t - 0.7) * 1.6; // 快速结束
    }
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