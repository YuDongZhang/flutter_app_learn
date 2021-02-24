import 'dart:async';
/// 还是搞 3 个队列 , 执行完一个  , 再执行下一个
/// 1 , main中 打印了 s9
/// 2 , 微队列中 s1 , s8 , 优先执行
/// 3 , 执行事件队列 , s2 会延时 ,
/// 4 , 执行future 时候 需要先执行完这个 future , 再轮到微队列 , s3 , s4 , s6 , s5放到 微队列里面 , 和上一的区别是对象正在创建
///     当 future 执行 完成 , 发现 微队列中 有 s5 , 所以 , 就先执行 s5 , 再回到事件队列
/// 5 , 剩下就是依次执行 future
void testScheduleMicrotask() {
  //918346572
  scheduleMicrotask(() => print('s1'));

  new Future.delayed(new Duration(seconds: 1), () => print('s2'));//在事件队列的延时不会阻塞

  new Future(() => print('s3')).then((_) {
    print('s4');
    scheduleMicrotask(() => print('s5'));
  }).then((_) => print('s6'));

  new Future(() => print('s10'))
      .then((_) => new Future(() => print('s11')))
      .then((_) => print('s12'));

  new Future(() => print('s7'));

  scheduleMicrotask(() => print('s8'));

  print('s9');
}

 main(){
  testScheduleMicrotask();
}