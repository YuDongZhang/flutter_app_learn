import 'package:flutter/material.dart';

class DrawerDemoPage extends StatelessWidget {
  const DrawerDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer 抽屉控件详解')),
      drawer: _DemoDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            color: Colors.blueAccent,
            margin: EdgeInsets.only(bottom: 24),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('学习导引', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 8),
                  Text('Drawer（抽屉）用于侧边导航，常见于 App 主体导航、设置、用户信息等场景。', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 8),
                  Text('本页将介绍 Drawer 的基本用法、用户信息头部、导航项、最佳实践等。', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          _DrawerSection(
            title: '基本用法',
            description: 'Scaffold 的 drawer 属性可快速集成侧边抽屉。',
            code: '''Scaffold(
  drawer: Drawer(
    child: ...
  ),
)''',
            demo: Text('请点击左上角菜单按钮体验 Drawer 效果'),
          ),
          SizedBox(height: 24),
          _DrawerSection(
            title: '用户信息头部',
            description: 'UserAccountsDrawerHeader 可展示用户头像、昵称、邮箱等信息。',
            code: '''UserAccountsDrawerHeader(
  accountName: Text('用户名'),
  accountEmail: Text('邮箱'),
  currentAccountPicture: CircleAvatar(
    backgroundImage: NetworkImage('...'),
  ),
)''',
            demo: UserAccountsDrawerHeader(
              accountName: Text('lao zhang'),
              accountEmail: Text('977872239@qq.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/16448943?s=60&v=4'),
              ),
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage('http://139.196.248.235:8089/clt/image/4/96/419.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.orangeAccent, BlendMode.srcOver),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          _DrawerSection(
            title: '导航项 ListTile',
            description: 'ListTile 可作为 Drawer 的导航项，支持图标、点击事件等。',
            code: '''ListTile(
  title: Text('设置'),
  trailing: Icon(Icons.settings),
  onTap: () {
    // 处理点击
  },
)''',
            demo: Column(
              children: [
                ListTile(
                  title: Text('message', textAlign: TextAlign.right),
                  trailing: Icon(Icons.message, color: Colors.black12, size: 22),
                ),
                ListTile(
                  title: Text('favorite', textAlign: TextAlign.right),
                  trailing: Icon(Icons.favorite, color: Colors.black12, size: 22),
                ),
                ListTile(
                  title: Text('settings', textAlign: TextAlign.right),
                  trailing: Icon(Icons.settings, color: Colors.black12, size: 22),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          _DrawerSection(
            title: '最佳实践',
            description: '1. 建议配合 Scaffold 使用。  2. 可结合 UserAccountsDrawerHeader 展示用户信息。  3. 导航项建议用 ListTile。  4. 点击导航项后可关闭 Drawer（Navigator.pop(context)）。',
            code: '''// 关闭 Drawer
Navigator.pop(context);''',
            demo: Text('更多高级用法可参考官方文档和社区示例。'),
          ),
        ],
      ),
    );
  }
}

class _DemoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('lao zhang'),
            accountEmail: const Text('977872239@qq.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/16448943?s=60&v=4'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              image: DecorationImage(
                image: NetworkImage('http://139.196.248.235:8089/clt/image/4/96/419.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.orangeAccent.withOpacity(0.6), BlendMode.srcOver),
              ),
            ),
          ),
          ListTile(
            title: const Text('message', textAlign: TextAlign.right),
            trailing: const Icon(Icons.message, color: Colors.black12, size: 22),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('favorite', textAlign: TextAlign.right),
            trailing: const Icon(Icons.favorite, color: Colors.black12, size: 22),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('settings', textAlign: TextAlign.right),
            trailing: const Icon(Icons.settings, color: Colors.black12, size: 22),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class _DrawerSection extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget demo;
  const _DrawerSection({
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