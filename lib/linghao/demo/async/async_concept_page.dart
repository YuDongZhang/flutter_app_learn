import 'package:flutter/material.dart';

class AsyncConceptPage extends StatelessWidget {
  const AsyncConceptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Concept'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '在 Flutter (以及其 Dart) 中，「异步」（Asynchronous）是一个极其核心且重要的概念。',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '简单来说，异步编程允许你的应用在等待某个操作（如网络请求、读取文件）完成时，不会“冻结”或“卡住”用户界面 (UI)。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '🤔 为什么 Flutter 需要异步？',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Flutter 应用（绝大多数情况下）运行在单个线程上。这个线程被称为“主线程”或“UI 线程”。',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '这个线程的职责是：',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. 绘制 UI：更新屏幕上的内容（大约每秒 60 次）。'),
                  Text('2. 响应用户事件：如点击、滚动、输入等。'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              '问题来了： 如果你在这个主线程上执行一个耗时的任务，比如：',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• 从互联网下载一个大文件（可能需要 5 秒）'),
                  Text('• 从数据库读取大量数据（可能需要 2 秒）'),
                  Text('• 执行一个复杂的计算'),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              '...会发生什么？',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              '在任务完成之前，主线程会被完全阻塞。它无法绘制新的 UI 帧，也无法响应用户点击。从用户的角度来看，App 僵死了（jank）。',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            SizedBox(height: 24),
            Text(
              '解决方案： 异步编程。',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '你可以把它想象成在餐厅点餐：',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• 同步 (Synchronous) - 坏的！ 你告诉服务员你要什么，然后你（和整个餐厅）都必须站在那里，盯着厨房，直到你的菜做-ET-来。期间你不能做任何事。'),
                  SizedBox(height: 8),
                  Text(
                      '• 异步 (Asynchronous) - 好的！ 你告诉服务员你要什么，服务员给你一个“取餐器”（一个 Future）。然后你就可以回到座位上玩手机、和朋友聊天（App 保持响应）。当你的菜（数据）准备好了，取餐器震动（Future 完成），你再去取餐（使用数据更新 UI）。'),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              '🚀 Flutter/Dart 中的异步核心概念',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Dart 语言提供了强大的异步支持，主要通过以下几个关键字和类：',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Future',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Future 是异步编程的基石。它代表一个“承诺”，承诺在未来某个时刻会产出一个值（或者一个错误）。',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '一个 Future 只有两种状态：',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• 未完成 (Uncompleted)：异步操作还在进行中。'),
                        Text('• 已完成 (Completed)：操作已结束。'),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• 带有一个值：操作成功，返回了数据（例如，从服务器拿到的 JSON）。'),
                        Text('• 带有一个错误：操作失败（例如，网络-ET-线、服务器 404）。'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2. async 和 await',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'async 和 await 是让异步代码看起来像同步代码的“语法糖”，它们极大地简化了异步编程。',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'async：',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• 用 async 关键字标记一个函数，表明这个函数是异步函数。'),
                        Text(
                            '• 异步函数总是返回一个 Future。如果你的函数声明返回 Future<String>，它会按预期工作。如果你声明返回 String，async 关键字会自动-EB-它包装成 Future<String>。'),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'await：',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• await 关键字只能在 async 函数内部使用。'),
                        Text('• 它告诉 Dart：“请暂停执行这个函数（而不是整个应用），直到后面的 Future 完成。一旦它完成了，请把结果（或错误）给我，然后继续执行-ET-面的代码。”'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
