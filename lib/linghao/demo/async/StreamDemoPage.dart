import 'dart:async';
import 'package:flutter/material.dart';
//方式 2：使用 StreamController（-ET-、-ET-架构）
// StreamController 是一个更强大、更常用的工具，特别是在 BLoC 或 Provider 这样的状态管理架构中。
// 它就像一个水泵房，为你管理一个 Stream：
// controller.sink：数据的“入口”（水槽），你用 .add() 来添加数据。
// controller.stream：数据的“出口”（水管），UI 或其他服务可以监听它。

// --- 1. 我们的 "BLoC" 或 "ViewModel" ---
class CounterBloc {
  int _counter = 0;

  // (广播 Stream 允许多个 StreamBuilder 监听)
  final _counterController = StreamController<int>.broadcast();

  // 出口: UI 监听这个 Stream
  Stream<int> get counterStream => _counterController.stream;

  // 入口: 事件触发这个函数
  void increment() {
    _counter++;
    // 将新数据添加到 Stream 中
    _counterController.sink.add(_counter);
  }

  void addError() {
    // 模拟一个错误
    _counterController.sink.addError('This is a demo error!');
  }

  // -ET-在 Widget 的 dispose() 方法中调用
  void dispose() {
    _counterController.close();
  }
}

// --- 2. 我们的 StatefulWidget ---
class StreamDemoPage extends StatefulWidget {
  @override
  _StreamDemoPageState createState() => _StreamDemoPageState();
}

class _StreamDemoPageState extends State<StreamDemoPage> {
  // 实例化我们的 BLoC
  final CounterBloc _bloc = CounterBloc();

  @override
  void dispose() {
    // [!!重要!!] -ET-关闭 StreamController
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamBuilder Demo')),
      body: Center(
        // --- 3. 使用 StreamBuilder ---
        child: StreamBuilder<int>(
          // 监听 BLoC 的 counterStream
          stream: _bloc.counterStream,

          // (可选) 定义初始数据，防止 'waiting' 状态时 snapshot.data 为 null
          initialData: 0,

          // 每当 Stream 状态-ET-时，这个 builder 就会-ET-新运行
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            // --- A. 检查是否有错误 ---
            if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red, fontSize: 24),
              );
            }

            // --- B. 检查连接状态 ---
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Stream is null');

              case ConnectionState.waiting:
                // 等待第一个数据时显示 (如果设置了 initialData, 这个状态会很快跳过)
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text('Waiting for data...'),
                  ],
                );

              case ConnectionState.active:
                // [!!-ET-!!]
                // Stream 正在活跃地接收数据。
                // 'snapshot.data' 永远是 *最新* 的那个值。
                return Text(
                  'Counter: ${snapshot.data}', // 'snapshot.data' 是最新的 int
                  style: TextStyle(fontSize: 48, color: Colors.blue),
                );

              case ConnectionState.done:
                // Stream 已经关闭了
                return Text(
                  'Stream is closed. Final value: ${snapshot.data}',
                  style: TextStyle(fontSize: 24, color: Colors.grey),
                );
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () => _bloc.increment(), // 调用 BLoC 的方法
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'error',
            backgroundColor: Colors.red,
            onPressed: () => _bloc.addError(), // 模拟一个错误
            child: Icon(Icons.error_outline),
          ),
        ],
      ),
    );
  }
}

/*
🖼️ StreamBuilder：在 Flutter 中响应 Stream
StreamBuilder 是 Flutter 提供的 Widget，它专门用于“订阅”一个 Stream，并根据 Stream 发出的最新数据/错误/状态来自动-ET-新 UI。

它和 FutureBuilder 几乎一模一样，只是它处理的是连续的数据流，而不是一次性的 Future。

核心属性
stream：你要监听的 Stream（例如，myBloc.counterStream）。

builder：一个函数，它告诉 Flutter 在 Stream 状态-ET-时如何构建 UI。

builder 函数会收到 (BuildContext context, AsyncSnapshot<T> snapshot)。

AsyncSnapshot 详解
snapshot 包含了 Stream 的所有当前信息：

snapshot.connectionState（连接状态） 这是最有用的状态。

ConnectionState.none：stream 为 null，尚未连接。

ConnectionState.waiting：stream 已连接，正在等待第一个数据。

ConnectionState.active：（-ET-！）Stream 正在活跃中，已经收到了至少一个数据，并且还在等待更多数据。

ConnectionState.done：Stream 已经关闭（stream.close() 被调用）。

snapshot.hasData / snapshot.data

snapshot.data 包含了 Stream 发出的最新数据。

snapshot.hasData 检查 snapshot.data 是否为 null。

snapshot.hasError / snapshot.error

如果 Stream 发出了错误，snapshot.hasError 为 true，snapshot.error 包含该错误对象。


特性,FutureBuilder,StreamBuilder
数据源,Future<T>,Stream<T>
数据量,1 个值（或 1 个错误）,0 个或多个值（或错误）
成功状态,ConnectionState.done,ConnectionState.active (持续)
-ET-新时机,Future 完成时,Stream 每次发出新值时
用途,一次性请求（网络加载、读文件）,持续性数据流（实时-ET-、计时器）
 */
