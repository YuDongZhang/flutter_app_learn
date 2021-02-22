import 'package:flutter_app_learn/mylib1.dart';

///技术要点
/// runtimeType : 获取类型
/// 静态变量 : static
/// 重写操作符 : operator
/// .noSuchMethod() : 要在代码尝试使用不存在的方法或实例变量时检测或做出反应，您可以重写
///
///
///就是一个普遍类
class Test {
  void tests() {
    print("普通类");
  }

  // 除非你重写noSuchMethod，否则使用不存在的成员会导致NoSuchMethodError
  // Unless you override noSuchMethod, using a
  // non-existent member results in a NoSuchMethodError.
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }

  dynamic foo();

  // 你不能调用未实现的方法，除非以下的某一条是true：
  //
  // 1.接收处有静态类型dynamic
  // 2.接收处定义了一个未实现的方法（abstract也是OK的）的静态类型dynamic，接收器的动态类型的实现与类noSuchMethod() 中的实现不同Object。
  // 有关更多信息，请参阅非正式 noSuchMethod转发规范
  //
  // 作者：AWeiLoveAndroid
  // 链接：https://www.jianshu.com/p/44ae73a58ebc
  // 来源：简书
  // 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
}

void main() {
  new Test().tests();
  Test().tests();

 dynamic f =  Test().foo();
 f(42);

  ///可以省略 new 关键字 ,直接调用

  ///2).要在运行时获取对象的类型，可以使用Object类的runtimeType属性，该属性返回一个Type对象。
  var a = 10;
  print('a 的类型是： ${a.runtimeType}'); // a 的类型是： int
}
