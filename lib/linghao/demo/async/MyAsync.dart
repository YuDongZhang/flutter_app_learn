import 'package:flutter/material.dart';

class MyAsyncWidget extends StatefulWidget {
  @override
  _MyAsyncWidgetState createState() => _MyAsyncWidgetState();
}

class _MyAsyncWidgetState extends State<MyAsyncWidget> {
  String _data = 'Loading...'; // 初始显示的文本
  bool _isLoading = false;

  // 1. 创建一个 async 函数来调用
  Future<void> _fetchData() async {
    // 2. 更新 UI 为“加载中”
    setState(() {
      _isLoading = true;
      _data = 'Fetching data...';
    });

    try {
      // 3. 使用 await 暂停 *此函数*，等待 fetchUserData() 完成
      //    UI 线程在此期间是自由的，可以响应点击、播放动画等
      String result = await fetchUserData();

      // 4. 当 await 结束，代码继续执行
      //    使用 setState 更新 UI
      setState(() {
        _data = result; // 显示获取到的数据
        _isLoading = false;
      });
    } catch (e) {
      // 5. 别忘了处理错误
      setState(() {
        _data = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData(); // 页面加载时自动获取数据
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Async Demo')),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator() // 加载时显示菊花
            : Text(_data, style: TextStyle(fontSize: 24)), // 加载完成显示数据
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchData, // 点击按钮时-ET-新获取数据
        child: Icon(Icons.refresh),
      ),
    );
  }
}

// 模拟的网络请求
Future<String> fetchUserData() {
  return Future.delayed(Duration(seconds: 2), () => 'Data fetched successfully!');
}
