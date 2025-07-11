import 'package:flutter/material.dart';

class BottomSheetDemoPage extends StatefulWidget {
  const BottomSheetDemoPage({super.key});

  @override
  State<BottomSheetDemoPage> createState() => _BottomSheetDemoPageState();
}

class _BottomSheetDemoPageState extends State<BottomSheetDemoPage> {
  void _showPersistentBottomSheet() {
    showBottomSheet(
      context: context,
      builder: (context) => BottomAppBar(
        child: Container(
          height: 90,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: const [
              Icon(Icons.pause_circle_outline),
              SizedBox(width: 16),
              Text('01:30 / 03:30'),
              Spacer(),
              Text('Fix you - Coldplay', textAlign: TextAlign.right),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showModalBottomSheet() async {
    final option = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SizedBox(
        height: 200,
        child: Column(
          children: [
            ListTile(
              title: const Text('Option A'),
              onTap: () => Navigator.pop(context, 'A'),
            ),
            ListTile(
              title: const Text('Option B'),
              onTap: () => Navigator.pop(context, 'B'),
            ),
            ListTile(
              title: const Text('Option C'),
              onTap: () => Navigator.pop(context, 'C'),
            ),
          ],
        ),
      ),
    );
    if (option != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('你选择了: $option')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomSheet 底部弹窗详解')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.blue[50],
            margin: const EdgeInsets.only(bottom: 24),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('学习导引', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('BottomSheet（底部弹窗）用于从屏幕底部弹出内容，常用于操作菜单、选项选择等场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 BottomSheet 的基本用法、模态与持久底部弹窗、自定义样式、最佳实践等。'),
                ],
              ),
            ),
          ),
          _BottomSheetSection(
            title: '基本用法',
            description: '使用 showModalBottomSheet 或 showBottomSheet 弹出底部弹窗。',
            code: '''showModalBottomSheet(
  context: context,
  builder: (context) => ...,
);''',
            demo: Row(
              children: [
                ElevatedButton(
                  onPressed: _showModalBottomSheet,
                  child: const Text('模态底部弹窗'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _showPersistentBottomSheet,
                  child: const Text('持久底部弹窗'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _BottomSheetSection(
            title: '模态底部弹窗',
            description: 'showModalBottomSheet 会弹出一个遮罩层，用户必须操作弹窗或点击遮罩关闭。',
            code: '''final result = await showModalBottomSheet<String>(
  context: context,
  builder: (context) => Column(
    children: [
      ListTile(title: Text('A'), onTap: () => Navigator.pop(context, 'A')),
      ...
    ],
  ),
);
if (result != null) {
  // 处理选择结果
}''',
            demo: ElevatedButton(
              onPressed: _showModalBottomSheet,
              child: const Text('演示模态底部弹窗'),
            ),
          ),
          const SizedBox(height: 24),
          _BottomSheetSection(
            title: '持久底部弹窗',
            description: 'showBottomSheet 直接弹出内容，不会有遮罩层，适合播放控制条等场景。',
            code: '''showBottomSheet(
  context: context,
  builder: (context) => BottomAppBar(
    child: Container(
      height: 90,
      child: ...
    ),
  ),
);''',
            demo: ElevatedButton(
              onPressed: _showPersistentBottomSheet,
              child: const Text('演示持久底部弹窗'),
            ),
          ),
          const SizedBox(height: 24),
          _BottomSheetSection(
            title: '自定义样式',
            description: '可自定义圆角、背景色、内容等。',
            code: '''showModalBottomSheet(
  context: context,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  ),
  backgroundColor: Colors.amber[50],
  builder: (context) => ...,
);''',
            demo: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  backgroundColor: Colors.amber[50],
                  builder: (context) => SizedBox(
                    height: 120,
                    child: Center(
                      child: Text('自定义样式 BottomSheet', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                );
              },
              child: const Text('演示自定义样式'),
            ),
          ),
          const SizedBox(height: 24),
          _BottomSheetSection(
            title: '最佳实践',
            description: '''1. 推荐优先使用 showModalBottomSheet。
2. 持久底部弹窗适合播放控制条等场景。
3. 可自定义圆角、背景色、内容。
4. 弹窗内容建议简洁明了，避免复杂交互。
5. 关闭弹窗可用 Navigator.pop(context)。''',
            code: '''showModalBottomSheet(
  context: context,
  builder: (context) => ...,
);''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
    );
  }
}

class _BottomSheetSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _BottomSheetSection({
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