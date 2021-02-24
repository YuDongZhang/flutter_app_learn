import 'dart:io';



///这种方式是 阻塞
// void doTask(){
//   sleep(Duration(seconds: 2));
//   print('我睡了2秒');
// }
//
// void main(){
//   print("begin");
//   doTask();
//   print("end");
// }

///异步方法 , async  , await , await 必须在 async 里面
// void doTask() async{
//  await sleep(Duration(seconds: 2));
//   print('我睡了2秒');
// }
//
// void main(){
//   print("begin");
//   doTask();
//   print("end");
//
// }

/// future api
Future checkVersion() async{

}