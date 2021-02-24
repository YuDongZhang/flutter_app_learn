import 'dart:async';

/// 异步关键字 async*
main() {
  //异步生成器
  //调用getAsyncGenerator立即返回Stream,只有执行了listen，函数才会开始执行
  // getAsyncGenerator(5).listen((value) => print(value));
  StreamSubscription subscription = getAsyncGenerator(5).listen(null);
  subscription.onData((value) {
    print(value);
    if (value >= 2) {
      subscription.pause(); //可以使用StreamSubscription对象对数据流进行控制
    }
  });
}

//异步生成器： 使用async*，返回的是Stream对象
Stream<int> getAsyncGenerator(int n) async* {
  print('start');
  int k = 0;
  while (k < n) {
    //yield不用暂停，数据以流的方式一次性推送,通过StreamSubscription进行控制
    yield k++;
  }
  print('end');
}
