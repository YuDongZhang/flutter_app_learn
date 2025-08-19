import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeDemoPage extends StatefulWidget {
  const DateTimeDemoPage({super.key});

  @override
  State<DateTimeDemoPage> createState() => _DateTimeDemoPageState();
}

class _DateTimeDemoPageState extends State<DateTimeDemoPage> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = const TimeOfDay(hour: 9, minute: 30);

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() => _selectedDate = date);
    }
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (time != null) {
      setState(() => _selectedTime = time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DateTime 日期时间控件详解')),
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
                  Text('日期和时间在表单、日程、提醒等场景中非常常见。Flutter 提供了 DateTime、TimeOfDay、showDatePicker、showTimePicker 等丰富的日期时间处理与选择控件。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 DateTime 的基本用法、日期选择、时间选择、格式化等。'),
                ],
              ),
            ),
          ),
          _DateTimeSection(
            title: 'DateTime 基本用法',
            description: 'DateTime 表示日期和时间，可通过 now() 获取当前时间。',
            code: '''final now = DateTime.now();
print(now); // 2024-05-01 10:30:00.000''',
            demo: Text('当前时间: ${DateTime.now()}'),
          ),
          const SizedBox(height: 24),
          _DateTimeSection(
            title: '日期选择 showDatePicker',
            description: 'showDatePicker 弹出日期选择对话框，返回用户选择的日期。',
            code: '''final date = await showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2000),
  lastDate: DateTime(2100),
);''',
            demo: Row(
              children: [
                Text('选择日期: ${DateFormat.yMMMMd().format(_selectedDate)}'),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _pickDate,
                  child: const Text('选择日期'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _DateTimeSection(
            title: '时间选择 showTimePicker',
            description: 'showTimePicker 弹出时间选择对话框，返回用户选择的时间。',
            code: '''final time = await showTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
);''',
            demo: Row(
              children: [
                Text('选择时间: ${_selectedTime.format(context)}'),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _pickTime,
                  child: const Text('选择时间'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _DateTimeSection(
            title: '日期时间格式化',
            description: 'intl 包的 DateFormat 可自定义日期时间格式。',
            code: '''import 'package:intl/intl.dart';
final formatted = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);''',
            demo: Text('格式化: ${DateFormat('yyyy-MM-dd HH:mm').format(_selectedDate)}'),
          ),
          const SizedBox(height: 24),
          _DateTimeSection(
            title: '最佳实践与注意事项',
            description: '1. 日期时间建议统一时区  2. showDatePicker/showTimePicker 需 await。  3. 格式化需引入 intl 包。4. 可结合 TextFormField 实现表单日期选择。',
            code: '''// 结合 TextFormField
TextFormField(
  controller: controller,
  readOnly: true,
  onTap: () async {
    final date = await showDatePicker(...);
    if (date != null) controller.text = DateFormat('yyyy-MM-dd').format(date);
  },
)''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
    );
  }
}

class _DateTimeSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _DateTimeSection({
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