import 'package:flutter/material.dart';

class IsolateDetailPage extends StatelessWidget {
  const IsolateDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_KnowledgePoint> points = [
      _KnowledgePoint(
        title: 'Isolate 基本概念',
        explanation: 'Dart 的 Isolate 是独立的执行单元，拥有自己的内存和事件循环，适合多核并发和耗时任务。',
        code: '''
import 'dart:isolate';

void main() async {
  var receivePort = ReceivePort();
  await Isolate.spawn(echo, receivePort.sendPort);
}
''',
      ),
      _KnowledgePoint(
        title: 'Isolate 通信',
        explanation: 'Isolate 之间不能共享内存，只能通过消息（SendPort/ReceivePort）通信。',
        code: '''
void echo(SendPort sendPort) async {
  var port = ReceivePort();
  sendPort.send(port.sendPort);
  await for (var msg in port) {
    var data = msg[0];
    SendPort replyTo = msg[1];
    replyTo.send(data);
    if (data == "bar") port.close();
  }
}
''',
      ),
      _KnowledgePoint(
        title: '主 Isolate 与新 Isolate 通信流程',
        explanation: '主 Isolate 创建 ReceivePort，启动新 Isolate 并传递 SendPort，双方通过端口互发消息。',
        code: '''
var receivePort = ReceivePort();
await Isolate.spawn(echo, receivePort.sendPort);
var sendPort = await receivePort.first;
var msg = await sendReceive(sendPort, "foo");
''',
      ),
      _KnowledgePoint(
        title: 'sendReceive 辅助函数',
        explanation: '封装消息发送和接收，简化 Isolate 通信。',
        code: '''
Future sendReceive(SendPort port, msg) {
  ReceivePort response = ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}
''',
      ),
      _KnowledgePoint(
        title: 'Isolate 的关闭',
        explanation: 'Isolate 可通过 port.close() 关闭消息端口，或调用 Isolate.kill() 终止。',
        code: '''
port.close(); // 关闭消息端口
isolate.kill(priority: Isolate.immediate); // 立即终止 Isolate
''',
      ),
      _KnowledgePoint(
        title: 'Isolate 的应用场景',
        explanation: '适合 CPU 密集型、耗时计算、解耦 UI 与后台任务等场景。',
        code: '''
// 计算密集型任务
void heavyTask() {
  // ...
}
Isolate.spawn(heavyTask, null);
''',
      ),
      _KnowledgePoint(
        title: 'Isolate 与 Future/async 区别',
        explanation: 'Future/async 适合 IO、网络等异步，Isolate 适合多核并发和计算密集型任务。',
        code: '''
// Future/async 只在主 Isolate 执行
// Isolate 可多核并发，互不影响
''',
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Isolate 详解')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: points.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Card(
              color: Colors.blue[50],
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('学习引导', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                    SizedBox(height: 8),
                    Text('本页系统梳理 Dart Isolate 相关知识点。每个知识点包含简明讲解和示例代码，建议：'),
                    SizedBox(height: 4),
                    Text('1. 先理解 Isolate 的基本原理和通信机制；'),
                    Text('2. 结合示例代码，掌握 Isolate 的创建、通信、关闭等用法；'),
                    Text('3. 理解 Isolate 与 Future/async 的区别，合理选择并发方案。'),
                    SizedBox(height: 4),
                    Text('如有不懂，可结合官方文档或实际项目多练习。', style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            );
          }
          final item = points[index - 1];
          return _KnowledgeCard(item: item);
        },
      ),
    );
  }
}

class _KnowledgePoint {
  final String title;
  final String explanation;
  final String code;
  _KnowledgePoint({required this.title, required this.explanation, required this.code});
}

class _KnowledgeCard extends StatelessWidget {
  final _KnowledgePoint item;
  const _KnowledgeCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(item.explanation),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: const EdgeInsets.all(8),
              child: Text(item.code, style: const TextStyle(fontFamily: 'monospace')),
            ),
          ],
        ),
      ),
    );
  }
} 