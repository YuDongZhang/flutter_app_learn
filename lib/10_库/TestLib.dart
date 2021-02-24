import 'package:flutter_app_learn/libs/mylib1.dart' deferred as lib1;
import 'package:flutter_app_learn/libs/mylib2.dart' as lib2;

void main(){

  /// （二）指定库前缀 as
  //按这种方式导入写会报错,两个里面都是 hello方法
  // import 'package:flutter_app_learn/libs/mylib1.dart';
  // import 'package:flutter_app_learn/libs/mylib2.dart';
  // hello();

  //给指定的库加前缀 方便区分
  // import 'package:flutter_app_learn/libs/mylib1.dart';
  // import 'package:flutter_app_learn/libs/mylib2.dart' as lib2;
  //  hello();
  //  lib2.hello();

  ///（三）仅导入库的一部分  show , hide
  // 仅导入mylib.dart里面的test2函数
  // import 'libs/mylib.dart' show test2;
  // 刚好和show相反 除了test2函数之外  其它的都导入
  // import 'libs/mylib.dart' hide test2;
  //我们想导入mylib库，但是不想用里面的otherLib这个库 可以这样写
  // import 'libs/mylib.dart' hide otherLib;

  /// （四）懒加载一个库  deferred as  , 调用 loadLibrary()
  // 1).减少应用程序的初始启动时间。
  // 2).例如，执行A/B测试 - 尝试算法的替代实现。
  // 3).加载很少使用的功能，例如可选的屏幕和对话框。

  //import 'package:flutter_app_learn/libs/mylib1.dart' deferred as lib1;

  // Future hello() async {
  //   await lib1.loadLibrary(); //您可以在一个库上调用loadLibrary()多次，而不会出现问题。该库只加载一次。
  //   lib1.test();
  // }
  // hello();

  // 1).延迟库的常量不是导入文件中的常量。请记住，在加载延迟库之前，这些常量不存在。
  // 2).您不能在导入文件中使用延迟库中的类型。相反，请考虑将接口类型移动到由延迟库和导入文件导入的*库。
  // 3).Dart隐式插入loadLibrary()到你使用deferred as namespace定义的命名空间。loadLibrary()函数返回Future。

  ///（五）库的拆分 , 官方不推荐 , 只是作为了解



  /// （六）库的自动导入  export
  // 在A库中使用export关键字引入B库，当我们使用A库的时候，会自动引入B库，也就是说我们导入了A库，就可以使用B库了。

  /// （七）库的组成结构
  // 库的最低要求是：pubspec.yaml文件和lib目录。
  // 库的pubspec.yaml文件与普通应用程序包的文件格式相同。
  // lib目录：库代码位于lib 目录下，并且对其他包是公共的。您可以根据需要在lib下创建任何层次结构。
  // 声明一个库的关键字是library。
  // 例如在文件test.dart文件首行加上：library mylib; 表示这个库的名称是mylib


}