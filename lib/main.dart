import 'package:flutter/material.dart';
import 'package:flutter_app_learn/demo/DemoPage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'BasicKnowledgePage.dart';
import 'hight/HightKnowledgePage.dart';
import 'basic/READMEPage.dart';
import 'highttwo/AdvancedKnowledgePage.dart';
import 'advanced/WidgetKnowledgePage.dart';
import 'linghao/demo/getx/MyService.dart';

void main() {
  // runApp(const MyApp());
  // 为了让 Riverpod 在整个应用中生效，需要用 ProviderScope 包裹根组件
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 在 GetMaterialApp 之前，进行依赖注入
    // 注册 MyService，使其可以在任何 Controller 或 Widget 中被访问
    Get.put(MyService());
    // 注册 MyController，GetX 会自动以 "lazy" 模式创建它，即只有在第一次使用时才会创建
    Get.lazyPut(() => MyController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // 配置命名路由
      getPages: [
        GetPage(name: '/third', page: () => const DemoPage()),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              '知识列表',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            // 美观的知识列表
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BasicKnowledgePage(),
                      ),
                    );
                  },
                  child: const Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('基础知识', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
                // 替换为可点击的卡片
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdvancedKnowledgePage(),
                      ),
                    );
                  },
                  child: const Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('进阶知识', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WidgetKnowledgePage(),
                      ),
                    );
                  },
                  child: const Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('控件知识', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HightKnowledgePage(),
                      ),
                    );
                  },
                  child: const Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('高级知识', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DemoPage(),
                      ),
                    );
                  },
                  child: const Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('项目演示', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
