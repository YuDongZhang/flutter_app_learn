import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

// stless
// stful

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo; // sink 水槽, 水池的意思

  //移除小部件会执行这个方法
  @override
  void dispose() {
    _streamDemo.close(); //把不需要的stream 关掉
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('create stream');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo = StreamController.broadcast(); //这种形式可以多次订阅
    _sinkDemo = _streamDemo.sink;

    //有数据 ondata , 错误 onerror ,完成 onDone
    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

    print('end');
  }

  void onDone() {
    print('onDone');
  }

  void onError(error) {
    print('$error');
  }

  void onData(String data) {
    print('$data');
  }

  void onDataTwo(String data) {
    print('onDataTwo: $data');
  }

  void _pauseStream() {
    print('Pause subscription');
    _streamDemoSubscription.pause();
  }

  void _resumeStream() {
    print('Resume subscription');
    _streamDemoSubscription.resume();
  }

  void _cancelStream() {
    print('Cancel subscription');
    _streamDemoSubscription.cancel();
  }

  //可以点击 暂停 , 重启 , 添加 , 测试
  void _addDataToStream() async {
    print('Add data to stream.');

    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5)); //模拟网络请求
    // throw 'something happened'; //这里抛出错误的时候 , 就会在 onerroe 方法中执行
    return 'hello'; //要使用这个的数据 , 就要监听 stream
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: _addDataToStream,
              child: Text('Add'),
            ),
            FlatButton(onPressed: _pauseStream, child: Text('Pause')),
            FlatButton(onPressed: _resumeStream, child: Text('Resume')),
            FlatButton(onPressed: _cancelStream, child: Text('Cancel')),
          ],
        ),
      ),
    );
  }
}
