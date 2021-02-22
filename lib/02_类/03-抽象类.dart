///（2）抽象类
/// abstract

// 此类声明为abstract，因此无法实例化
abstract class Test {
  //定义构造函数，字段，方法...

  // 抽象方法
  void test();
}

class Big extends Test{
  @override
  void test() {
    // TODO: implement test
  }
  
}