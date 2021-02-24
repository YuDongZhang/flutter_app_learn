void main(){
  new Future(()=>futureTask())
    .then((i) => 'abc$i')//这里的i是上面 futureTask的结 10 ,
  .then((m) => print('$m'))//m 是上面的结果 , 即是 abc10 , 这里打印了 ,
  .then((_) => new Future.error('出错了'))
  .whenComplete(() => print('whenComplete'))//上面出错了这里还是可以操作 , 可以做一些操作
  // .catchError((e)=>print(e)) //这样会捕获错误
  .catchError((e)=>print(e),test: (Object object){ // 这里不写test 会默认有一个 , 返回的是 true
    print('test');
    return false;//返回 false 这样写不会捕获
  })
  ;
}

futureTask(){
  print('futureTask()');
  return 10;
}