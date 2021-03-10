import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  @override
  void initState() {
    super.initState();

    // Observable<String> _observable =
    // Observable(Stream.fromIterable(['hello', '您好']));//可迭代的数据
    // Observable.fromFuture(Future.value('hello ~'));//返回一个 future
    // Observable.fromIterable(['hello', '您好']);
    // Observable.just('hello ~');
    //     Observable.periodic(
    //         Duration(seconds: 3), (x) => x.toString()); //指定时间间隔重复触发
    //
    // _observable.listen(print);

    //类似于 streamcontrol
    // PublishSubject<String> _subject = PublishSubject<String>();
    // BehaviorSubject<String> _subject =
    //     BehaviorSubject<String>(); //把最后一次添加的数据作为新的数据交给新来的监听

    //数据全部交给监听器
    ReplaySubject<String> _subject =
        ReplaySubject<String>(maxSize: 2); //maxsize 最大接收的数量,也可以没有,第一个收不到

    _subject.add('hello');
    _subject.add('hola');
    _subject.add('hi');

    //监听 stream 或者observable ,如果stream需要有数据要写一个方法 如下 .  这个相当于订阅
    _subject.listen((data) => print('listen 1: $data'));
    _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
    _subject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
