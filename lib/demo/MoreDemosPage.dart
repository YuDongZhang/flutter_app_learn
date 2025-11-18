import 'package:flutter/material.dart';

class MoreDemosPage extends StatelessWidget {
  const MoreDemosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('项目演示三 - 更多演示'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '更多演示项目',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          
          // 演示卡片列表
          _buildDemoCard(
            context,
            '测试应用演示',
            'CircularProgressIndicator 演示\n包含多种进度条样式',
            Icons.baby_changing_station,
            Colors.orange,
            () => _showTestDemo(context),
          ),
          
          _buildDemoCard(
            context,
            '布局演示',
            'Row 和 Column 布局演示\n展示嵌套布局效果',
            Icons.dashboard,
            Colors.blue,
            () => _showLayoutDemo(context),
          ),
          
          _buildDemoCard(
            context,
            '基础学习演示',
            'ListView 网络图片展示\nStatelessWidget 演示',
            Icons.list_alt,
            Colors.green,
            () => _showBasicDemo(context),
          ),
          
          _buildDemoCard(
            context,
            '结构导航演示',
            'TabBar 和 Drawer 演示\nMaterial Design 组件',
            Icons.navigation,
            Colors.red,
            () => _showStructureDemo(context),
          ),
          
          _buildDemoCard(
            context,
            '基础部件演示',
            '完整的部件展示页面\n包含路由和国际化',
            Icons.widgets,
            Colors.purple,
            () => _showComponentsDemo(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTestDemo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: TestDemoPage(),
      ),
    );
  }

  void _showLayoutDemo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: LayoutDemoPage(),
      ),
    );
  }

  void _showBasicDemo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BasicDemoPage(),
      ),
    );
  }

  void _showStructureDemo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: StructureDemoPage(),
      ),
    );
  }

  void _showComponentsDemo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.95,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ComponentsDemoPage(),
      ),
    );
  }
}

// 这些包装类需要从各个源文件中提取或者重新实现关键部分

class TestDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('测试应用演示'),
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              left: 150.0,
              top: 20.0,
              child: CircularProgressIndicator(
                backgroundColor: const Color(0xffff0000),
              )),
          Positioned(
              left: 150.0,
              top: 70.0,
              child: CircularProgressIndicator(
                value: 0.3,
                backgroundColor: const Color(0xffff0000),
              )),
          Positioned(
              left: 150.0,
              top: 120.0,
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
                backgroundColor: const Color(0xffff0000),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
              )),
          Positioned(
              left: 150.0,
              top: 170.0,
              child: CircularProgressIndicator(
                strokeWidth: 8.0,
                backgroundColor: const Color(0xffff0000),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
              )),
          Positioned(
              left: 150.0,
              top: 220.0,
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  backgroundColor: const Color(0xffff0000),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              )),
          const Positioned(
              top: 300,
              child: Text(
                '老孟，一枚有态度的程序员。\n欢迎关注他的公众号',
                softWrap: true,
              ))
        ],
      ),
    );
  }
}

class LayoutDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('布局演示'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.orangeAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.green,
                    child: const Text('绿Container'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          color: Colors.purple, child: const Text('紫Container')),
                      Container(color: Colors.red, child: const Text('红Container')),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: const Text('蓝Container'),
            ),
          ],
        ),
      ),
    );
  }
}

class BasicDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础学习演示'),
        backgroundColor: Colors.yellow,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite,
              size: 64,
              color: Colors.red,
            ),
            SizedBox(height: 16),
            Text(
              'Flutter 基础演示',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '这是来自 linghao/01-基础.dart 的演示',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StructureDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('结构导航演示'),
        backgroundColor: Colors.yellow,
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.local_florist)),
            Tab(icon: Icon(Icons.change_history)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          Center(child: Icon(Icons.list, size: 64)),
          Center(child: Icon(Icons.change_history, size: 64)),
          Center(child: Icon(Icons.directions_bike, size: 64)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer 演示',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('首页'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
            ),
          ],
        ),
      ),
    );
  }
}

class ComponentsDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('基础部件演示'),
        backgroundColor: Colors.yellow,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.widgets,
              size: 64,
              color: Colors.purple,
            ),
            SizedBox(height: 16),
            Text(
              'Flutter 部件展示',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '包含国际化、路由、动画等特性',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: null,
              child: Text('示例按钮'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: '示例输入框',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}