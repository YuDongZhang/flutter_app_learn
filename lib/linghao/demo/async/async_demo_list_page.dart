import 'package:flutter/material.dart';
import 'async_concept_page.dart';
import 'future_demo.dart';

class AsyncDemoListPage extends StatelessWidget {
  const AsyncDemoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Demos'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Future Demo'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FutureDemo()),
            ),
          ),
          ListTile(
            title: const Text('异步的概念'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AsyncConceptPage()),
            ),
          ),
        ],
      ),
    );
  }
}
