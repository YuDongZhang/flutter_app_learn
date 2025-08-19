import 'package:flutter/material.dart';

class ChipDemoPage extends StatefulWidget {
  const ChipDemoPage({super.key});

  @override
  State<ChipDemoPage> createState() => _ChipDemoPageState();
}

class _ChipDemoPageState extends State<ChipDemoPage> {
  List<String> _tags = ['Apple', 'Banana', 'Lemon'];
  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'Lemon';

  void _reset() {
    setState(() {
      _tags = ['Apple', 'Banana', 'Lemon'];
      _selected = [];
      _choice = 'Lemon';
      _action = 'Nothing';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chip 标签控件详解')),
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
                  Text('Chip 是用于展示信息、状态、操作的紧凑元素，常用于标签、筛选、操作等场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 Chip 的基本用法、头像、可删除、ActionChip、FilterChip、ChoiceChip 等。'),
                ],
              ),
            ),
          ),
          _ChipSection(
            title: '基本用法',
            description: 'Chip 可用于展示简单标签。',
            code: '''Chip(
  label: Text('标签'),
)''',
            demo: Wrap(
              spacing: 8,
              children: const [
                Chip(label: Text('Apple')),
                Chip(label: Text('Banana'), backgroundColor: Colors.orange),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _ChipSection(
            title: '头像与可删除',
            description: 'avatar 可添加头像，onDeleted 可添加删除按钮。',
            code: '''Chip(
  label: Text('用户'),
  avatar: CircleAvatar(child: Text('A')),
  onDeleted: () {},
)''',
            demo: Wrap(
              spacing: 8,
              children: [
                Chip(
                  label: const Text('Wanghao'),
                  avatar: const CircleAvatar(child: Text('皓')),
                ),
                Chip(
                  label: const Text('City'),
                  onDeleted: () {},
                  deleteIcon: const Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this tag',
                ),
                Chip(
                  label: const Text('头像'),
                  avatar: const CircleAvatar(
                    backgroundImage: NetworkImage('https://resources.ninghao.net/images/wanghao.jpg'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _ChipSection(
            title: '动态标签与删除',
            description: '可动态删除标签，常用于标签管理。',
            code: '''Chip(
  label: Text(tag),
  onDeleted: () {
    // 删除标签
  },
)''',
            demo: Wrap(
              spacing: 8,
              children: _tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  onDeleted: () {
                    setState(() => _tags.remove(tag));
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          _ChipSection(
            title: 'ActionChip',
            description: 'ActionChip 可响应点击操作，常用于触发某个动作。',
            code: '''ActionChip(
  label: Text('操作'),
  onPressed: () {
    // 触发操作
  },
)''',
            demo: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ActionChip: $_action'),
                Wrap(
                  spacing: 8,
                  children: _tags.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() => _action = tag);
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _ChipSection(
            title: 'FilterChip',
            description: 'FilterChip 可多选，常用于筛选场景。',
            code: '''FilterChip(
  label: Text('筛选'),
  selected: selected,
  onSelected: (val) {
    // 选中/取消
  },
)''',
            demo: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('FilterChip: ${_selected.toString()}'),
                Wrap(
                  spacing: 8,
                  children: _tags.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (val) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _ChipSection(
            title: 'ChoiceChip',
            description: 'ChoiceChip 单选，常用于单项选择。',
            code: '''ChoiceChip(
  label: Text('选项'),
  selected: selected,
  onSelected: (val) {
    // 选中
  },
)''',
            demo: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ChoiceChip: $_choice'),
                Wrap(
                  spacing: 8,
                  children: _tags.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selectedColor: Colors.black,
                      selected: _choice == tag,
                      onSelected: (val) {
                        setState(() => _choice = tag);
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.restore),
              label: const Text('重置标签状态'),
              onPressed: _reset,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChipSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _ChipSection({
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