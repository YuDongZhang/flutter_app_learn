import 'package:flutter/material.dart';
import 'BasicKnowledgePage.dart';
import 'hight/HightKnowledgePage.dart';
import 'basic/READMEPage.dart';
import 'highttwo/AdvancedKnowledgePage.dart';
import 'advanced/WidgetKnowledgePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
