///当您需要懒惰地生成一系列值时，请考虑使用生成器函数。Dart支持两种生成器功能。
///同步生成器  Iterable  , sync* , yield
///首先返回的是 iterable 对象 ,
 void main(){
   //同步生成器
   //调用getSyncGenerator立即返回Iterable
   var it = getSyncGenerator(5).iterator;
//  调用moveNext方法时getSyncGenerator才开始执行
   while (it.moveNext()) {
     print(it.current);
   }

 }

 //同步生成器： 使用sync*，返回的是Iterable对象
 Iterable<int> getSyncGenerator(int n) sync* {
   print('start');
   int k = n;
   while (k > 0) {
     //yield会返回moveNext为true,并等待 moveNext 指令
     yield k--;
   }
   print('end');
 }