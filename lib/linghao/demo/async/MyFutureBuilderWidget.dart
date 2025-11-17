import 'package:flutter/material.dart';

class MyFutureBuilderWidget extends StatelessWidget {
  // 模拟的网络请求
  Future<String> fetchUserData() {
    return Future.delayed(Duration(seconds: 2), () {
      // return 'Data from FutureBuilder!';
      // 试试取消注释-ET-面这行，看 FutureBuilder 如何处理错误
      throw Exception('Oops, something went wrong');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FutureBuilder Demo')),
      body: Center(
        // 1. 使用 FutureBuilder
        child: FutureBuilder<String>(
          // 2. 告诉它要监听哪个 Future
          future: fetchUserData(),

          // 3. 'builder' 函数会在 Future 状态改变时-ET-新执行
          //    'snapshot' 包含了 Future 的当前状态和数据
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            // 状态 1：Future 正在进行中
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            // 状态 2：Future 完成但-ET-了错误
            if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red, fontSize: 20),
              );
            }

            // 状态 3：Future 成功完成
            if (snapshot.hasData) {
              // 'snapshot.data' 就是 Future 返回的数据
              return Text(
                snapshot.data!,
                style: TextStyle(fontSize: 24, color: Colors.green),
              );
            }

            // 默认情况（例如 Future 为 null）
            return Text('Click a button to start');
          },
        ),
      ),
    );
  }
}
