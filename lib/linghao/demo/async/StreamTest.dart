// 这个函数返回一个 Stream，它会每秒钟发出一个-ET-
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    // 1. 等待 1 秒
    await Future.delayed(Duration(seconds: 1));

    // 2. 'yield' 一个新值到 Stream 中
    yield i;

    // 模拟一个错误
    if (i == 3) {
      yield* Stream.error(Exception('Count reached 3!'));
    }
  }
}

// 如何使用这个 Stream？
// (我们稍后会用 StreamBuilder 来做，但这里是基本-ET-法)
void main() {
  Stream<int> stream = countStream(5);

  // 3. 'listen' (订阅) 这个 Stream
  stream.listen((data) {
    // 每次 yield 时触发
    print('Data: $data');
  }, onError: (err) {
    // 发生错误时触发
    print('Error: $err');
  }, onDone: () {
    // Stream 关闭时触发 (循环结束)
    print('Stream is done!');
  });
}

/*
输出会是：
(等1秒)
Data: 1
(等1秒)
Data: 2
(等1秒)
Error: Exception: Count reached 3!
(等1秒)
Data: 4
(等1秒)
Data: 5
(等1秒)
Stream is done!
*/
