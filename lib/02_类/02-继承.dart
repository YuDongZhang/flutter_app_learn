class Test {
  void test() {
    /*这里省略方法内部的逻辑操作*/
  }
// 其他逻辑
}

class TestChild extends Test {
  @override //@override标注在test()函数上面 表示test()函数是重写父类的。
  void test() {
    super.test(); // 调用父类的test()函数
    /*这里省略方法内部的逻辑操作*/
  }
// 其他逻辑
}

///父类
class Parent {
  int x;
  int y;

  //超类命名构造函数不会传递，如果希望使用超类中定义的命名构造函数创建子类，则必须在子类中实现该构造函数
  Parent.fromJson(x, y)
      : x = x,
        y = y {
    print('超类命名构造函数');
  }
}

///子类
class Child extends Parent {
  int x;
  int y;

  //如果超类没有默认构造函数， 则你需要手动的调用超类的其他构造函数
  Child(x, y)
      : x = x,
        y = y,
        super.fromJson(x, y) {
    //调用超类构造函数的参数无法访问 this
    print('子类构造函数');
  }

  //在构造函数的初始化列表中使用 super()，需要把它放到最后
  Child.fromJson(x, y)
      : x = x,
        y = y,
        super.fromJson(x, y) {
    print('子类命名构造函数');
  }
}

main() {
  //调用超类构造函数
  var child = Child.fromJson(1, 2);
  var child1 = Child(3, 4);
  print(child);
  print(child1);
}
