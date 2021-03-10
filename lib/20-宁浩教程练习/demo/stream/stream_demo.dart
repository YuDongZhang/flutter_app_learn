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

  @override
  void initState() {
    super.initState();
    print('create stream');
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    //有数据 ondata , 错误 onerror ,完成 onDone
    _streamDemo.listen(onData,onError: onError,onDone: onDone);
    print('end');

  }

  void onDone() {
    print('onDone');
  }

  void onError(error) {
    print('$error');
  }

  void  onData(String data) {
    print('$data');
  }

  Future<String> fetchData() async{
    await Future.delayed(Duration(seconds: 3));//模拟网络请求
    throw 'something happened'; //这里抛出错误的时候 , 就会在 onerroe 方法中执行
    return 'hello';//要使用这个的数据 , 就要监听 stream
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }


}
