void main(){
  testFuture();
}

void testFuture() {
  ///首先写的时候要有 3个 队列 , main 一个队列 , 事件队列 , 微事件队列

  ///首先代码顺序执行 , f0 , f1 , f2 , f3 都放到事件队列里面 ,从方法中往下看 , 把时间队列中的 f1,f2,f3都加上then(),
  /// 那么在 main() 打印了 f7 , 而后执行事件队列 , 首先是f0 , 打印了 f0_future()
  ///然后到 f1 , f1后面有then , 执行then 里面的 , 打印了 f1_them()null , f1的完成了
  ///到 f2 ,首先打印了 print 方法  "f2_then()_print()", 然后 碰到了new future , 这个是个事件, 放在事件队列的末尾  , f1.then 放到微队列里面 ,f2
  /// 执行完成
  ///到 f3 , 发现微队列中有数据 , 这时 先执行微队列 , 打印 "f1_then()在  f2_then() 中" , 再打印 f3的then , "f3_then()" ,f3执行完成
  ///到 new future , 打印 f2_then()_new future
  Future f0 = new Future(() => print("f0_future()"));
  Future f1 = new Future(() => null); //7163524
//  Future f1 = new Future.delayed(Duration(seconds: 1) ,() => null);//7132465
  Future f2 = new Future(() => null);
  Future f3 = new Future(() => null);

  f3.then((_) => print("f3_then()"));

  f2.then((_) {
    print("f2_then()_print()");
    new Future(() => print("f2_then()_new future"));
    f1.then((_) {
      print("f1_then()在  f2_then() 中");
    });
  });

  f1.then((m) { //m 即为 future 中的数字
    print('f1_them()$m');
  });

  print("f7");
}
