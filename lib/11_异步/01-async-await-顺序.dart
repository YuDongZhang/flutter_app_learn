import 'dart:io';


void main() {
  getName1();
  getName2();
  getName3();
}

// async函数只在遇到第一个await表达式时执行。然后它返回一个Future对象，仅在await表达式完成后才恢复执行。
// 碰到第一个 await 的时候 , 返回的是一个 future  ,
/// await 后面的方法会执行 , 只是这个方法之后的代码 , 会等待
getName1() async {
  await getStr1();
  await getStr2();
  print('Name1');
}

getStr1() {
  print('str1');
}

getStr2() {
  print('str2');
}

getName2() {
  print('name2');
}

getName3() {
  print('name3');
}
