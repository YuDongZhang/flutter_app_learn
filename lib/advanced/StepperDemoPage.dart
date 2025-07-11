import 'package:flutter/material.dart';

class StepperDemoPage extends StatefulWidget {
  const StepperDemoPage({super.key});

  @override
  State<StepperDemoPage> createState() => _StepperDemoPageState();
}

class _StepperDemoPageState extends State<StepperDemoPage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stepper 步进器控件详解')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.blue[50],
            margin: const EdgeInsets.only(bottom: 24),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('学习导引', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Stepper 步进器用于分步操作流程，常用于注册、支付、表单等场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 Stepper 的基本用法、自定义步骤、控制跳转、最佳实践等。'),
                ],
              ),
            ),
          ),
          _StepperSection(
            title: '基本用法',
            description: 'Stepper 通过 steps 定义每一步，currentStep 控制当前步骤。',
            code: '''Stepper(
  currentStep: currentStep,
  steps: [
    Step(title: Text('A'), content: Text('内容A')),
    ...
  ],
)''',
            demo: Stepper(
              currentStep: _currentStep,
              onStepTapped: (value) => setState(() => _currentStep = value),
              onStepContinue: () => setState(() => _currentStep < 2 ? _currentStep += 1 : _currentStep = 0),
              onStepCancel: () => setState(() => _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0),
              steps: const [
                Step(
                  title: Text('登录'),
                  subtitle: Text('第一步'),
                  content: Text('请输入账号密码'),
                  isActive: true,
                ),
                Step(
                  title: Text('选择套餐'),
                  subtitle: Text('第二步'),
                  content: Text('请选择套餐'),
                  isActive: true,
                ),
                Step(
                  title: Text('确认支付'),
                  subtitle: Text('第三步'),
                  content: Text('请确认支付信息'),
                  isActive: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _StepperSection(
            title: '自定义步骤内容',
            description: 'content 可为任意 Widget，如表单、图片等。',
            code: '''Step(
  title: Text('标题'),
  content: Column(children: [Text('内容'), ...]),
)''',
            demo: Stepper(
              currentStep: _currentStep,
              onStepTapped: (value) => setState(() => _currentStep = value),
              onStepContinue: () => setState(() => _currentStep < 2 ? _currentStep += 1 : _currentStep = 0),
              onStepCancel: () => setState(() => _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0),
              steps: [
                Step(
                  title: const Text('自定义'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('可以放表单、图片等'),
                      SizedBox(height: 8),
                      FlutterLogo(size: 32),
                    ],
                  ),
                  isActive: true,
                ),
                const Step(
                  title: Text('普通步骤'),
                  content: Text('内容'),
                  isActive: true,
                ),
                const Step(
                  title: Text('完成'),
                  content: Text('流程结束'),
                  isActive: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _StepperSection(
            title: '最佳实践',
            description: '''1. 步骤建议简洁明了。
2. 可自定义 content 内容。
3. currentStep 控制当前步骤。
4. 可结合表单、校验等。''',
            code: '''Stepper(
  currentStep: ...,
  onStepContinue: ...,
  onStepCancel: ...,
)''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
    );
  }
}

class _StepperSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _StepperSection({
    required this.title,
    required this.description,
    required this.code,
    required this.demo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: const EdgeInsets.all(8),
              child: Text(code, style: const TextStyle(fontFamily: 'monospace', fontSize: 14)),
            ),
            const SizedBox(height: 12),
            demo,
          ],
        ),
      ),
    );
  }
} 