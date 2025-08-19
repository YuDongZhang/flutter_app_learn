import 'package:flutter/material.dart';

class FormDemoPage extends StatefulWidget {
  const FormDemoPage({super.key});

  @override
  State<FormDemoPage> createState() => _FormDemoPageState();
}

class _FormDemoPageState extends State<FormDemoPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  bool _autoValidate = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('注册中...')),
      );
    } else {
      setState(() => _autoValidate = true);
    }
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return '用户名不能为空';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '密码不能为空';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form 表单控件详解')),
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
                  Text('Form（表单）用于收集和校验用户输入，常用于注册、登录、信息录入等场景。'),
                  SizedBox(height: 8),
                  Text('本页将介绍 Form 的基本用法、输入框、校验、提交、最佳实践等。'),
                ],
              ),
            ),
          ),
          _FormSection(
            title: '基本用法',
            description: 'Form 结合 TextFormField 可实现表单输入与校验。',
            code: '''Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(...),
      ElevatedButton(...),
    ],
  ),
)''',
            demo: Form(
              key: _formKey,
              autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: '用户名'),
                    validator: _validateUsername,
                    onSaved: (val) => _username = val ?? '',
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: '密码'),
                    obscureText: true,
                    validator: _validatePassword,
                    onSaved: (val) => _password = val ?? '',
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submit,
                      child: const Text('注册'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _FormSection(
            title: '输入框 TextFormField',
            description: 'TextFormField 支持输入监听、校验、密码输入等。',
            code: '''TextFormField(
  decoration: InputDecoration(labelText: '用户名'),
  validator: (val) {
    if (val == null || val.isEmpty) return '必填';
    return null;
  },
)''',
            demo: TextFormField(
              decoration: const InputDecoration(labelText: '示例输入框'),
              onChanged: (val) {},
            ),
          ),
          const SizedBox(height: 24),
          _FormSection(
            title: '表单校验与提交',
            description: 'FormState 的 validate/save 方法可校验和保存表单。',
            code: '''if (_formKey.currentState?.validate() ?? false) {
  _formKey.currentState?.save();
}''',
            demo: ElevatedButton(
              onPressed: _submit,
              child: const Text('提交表单'),
            ),
          ),
          const SizedBox(height: 24),
          _FormSection(
            title: '最佳实践',
            description: '''1. 使用 GlobalKey 管理表单状态。
2. 校验逻辑建议单独封装。
3. 可用 autovalidateMode 实现自动校验。
4. 提交后可用 SnackBar 反馈结果。''',
            code: '''// 自动校验
Form(
  autovalidateMode: AutovalidateMode.always,
)''',
            demo: const Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
    );
  }
}

class _FormSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _FormSection({
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