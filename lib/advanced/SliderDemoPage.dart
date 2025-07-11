import 'package:flutter/material.dart';

class SliderDemoPage extends StatefulWidget {
  const SliderDemoPage({super.key});

  @override
  State<SliderDemoPage> createState() => _SliderDemoPageState();
}

class _SliderDemoPageState extends State<SliderDemoPage> {
  double _sliderValue = 5.0;
  double _dividedSliderValue = 2.0;
  double _customSliderValue = 3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider 滑块控件详解')),
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
                  Text('Slider（滑块）用于在一定范围内选择一个值，常用于音量、亮度、进度等场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 Slider 的基本用法、分段与标签、自定义颜色与外观等。'),
                ],
              ),
            ),
          ),
          _SliderSection(
            title: '基本用法',
            description: 'Slider 用于选择范围内的值，onChanged 监听变化，min/max 设置范围。',
            code: '''Slider(
  value: value,
  onChanged: (val) {
    // 处理值变化
  },
  min: 0.0,
  max: 10.0,
)''',
            demo: Column(
              children: [
                Slider(
                  value: _sliderValue,
                  onChanged: (val) {
                    setState(() => _sliderValue = val);
                  },
                  min: 0.0,
                  max: 10.0,
                ),
                Text('当前值: ${_sliderValue.toStringAsFixed(1)}'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _SliderSection(
            title: '分段与标签',
            description: 'divisions 属性可将滑块分段，label 可显示当前值。',
            code: '''Slider(
  value: value,
  onChanged: (val) {},
  min: 0.0,
  max: 4.0,
  divisions: 4,
  label: ' {value.toInt()}',
)''',
            demo: Column(
              children: [
                Slider(
                  value: _dividedSliderValue,
                  onChanged: (val) {
                    setState(() => _dividedSliderValue = val);
                  },
                  min: 0.0,
                  max: 4.0,
                  divisions: 4,
                  label: '${_dividedSliderValue.toInt()}',
                ),
                Text('分段值: ${_dividedSliderValue.toStringAsFixed(1)}'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _SliderSection(
            title: '自定义颜色与外观',
            description: 'activeColor、inactiveColor 可自定义滑块颜色。SliderTheme 可进一步自定义外观。',
            code: '''Slider(
  value: value,
  onChanged: (val) {},
  activeColor: Colors.green,
  inactiveColor: Colors.grey,
)''',

// 更复杂的自定义可用 SliderTheme',
            demo: Column(
              children: [
                Slider(
                  value: _customSliderValue,
                  onChanged: (val) {
                    setState(() => _customSliderValue = val);
                  },
                  min: 0.0,
                  max: 5.0,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey[300],
                ),
                const SizedBox(height: 8),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.purple,
                    inactiveTrackColor: Colors.purple[100],
                    thumbColor: Colors.deepPurple,
                    overlayColor: Colors.deepPurple.withOpacity(0.2),
                    valueIndicatorColor: Colors.deepPurple,
                  ),
                  child: Slider(
                    value: _customSliderValue,
                    onChanged: (val) {
                      setState(() => _customSliderValue = val);
                    },
                    min: 0.0,
                    max: 5.0,
                    divisions: 5,
                    label: '${_customSliderValue.toInt()}',
                  ),
                ),
                Text('自定义值: ${_customSliderValue.toStringAsFixed(1)}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SliderSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _SliderSection({
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