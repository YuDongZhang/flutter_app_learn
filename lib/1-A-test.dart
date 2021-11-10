import 'dart:core';

void main() {
  //未初始化变量声明 , var dynamic  object 都可以声明都可以改变
  dynamic data;
  data = 1;
  data = "aaaaaaa";

  //声明初始化变量 , 会检查类型
  var data1 = 123;
  // data1 = '46546';
  data1 = 456;

  dynamic d1 = '1234';
  Object o1 = '121';

  //dynamic 在编码的时候不会检查 ,在编译的时候检查
  //object 在编码的时候就会检查
  //testt() 方法根本就没有写
  // d1.testt();//注销查看
  // o1.testt();//注销查看

  var varList = const [1, 2, 3];
  final finalList = const [1, 2, 3];
  const constList = [1, 2, 3];

//可选命名参数：使用 {param1, param2, …} 的形式来指定命名参数
  int add2(int c, {int a, int b}) {
    return a + b;
  }

  print("可选命名参数: " + add2(3, a: 1, b: 3).toString());

//可选位置参数：把可选参数放到 [] 中，必填参数要放在可选参数前面
  void add3(String x, [String y, String z]) {
    print("可选位置参数：x=$x y=$y z=$z");
  }

  add3("1");
  add3("1", "2");
  add3("1", "2", "3");

  List test(List list, String func(str)) {
    for (var i = 0; i < list.length; i++) {
      list[i] = func(list[i]);
    }
    return list;
  }

  var ls = ['aa ', 'bb ', 'cc '];
  print('函数作为参数: ' + test(ls, (str) => str * 2).toString());

  //这个返回的是list ,
//  List test(List list, String func(str)) {
//    for (var i = 0; i < list.length; i++) {
//      list[i] = func(list[i]);
//    }
//      return list;
//  }
  // var ls = ['aala', 'bbb', ' sdhdhd'];
  // print(test(ls, (str) => str * 2));//乘以 2 之后 , 再赋值给 i
  //[aalaaala, bbb,  sdhdhd] 结果
//
  var list2 = ['aala', 'bbb', 'sdhdhd'];
  list2.forEach((cc) => print('遍历: ' + cc));

//闭包
  Function makeAddFunc(int a) {
    return (int y) => a + y;
  }

  //这一步的时候传的 是 a = 12
  //是将  return (int y) => a + y; 匿名方法赋值给 addfunc
  //很容易让人看不懂 , 返回的就是一个方法
  var addFunc = makeAddFunc(12);
  //这里就是通过 变量来调 ,其实调的是匿名闭包中的匿名函数
  //(int y) => a + y;
  //里面的 y为22 ,
  print('闭包: ' + addFunc(22).toString()); // 结果 34

  Child child = Child(1, 2);
  print(child);

  print("-----------------------------------");

  Point2 point2 = Point2(1, 2);
  point2.printX();

  print("----------------对象的set和get--------------------");

//  //用法
  var rectangle = Rectangle(0, 0, 1, 1);
  print('对象的get()方法: ' + rectangle.left.toString()); //get
  rectangle.right = 2; //set
  print('测试上一步对象set结果: ' + rectangle.right.toString());
  //总结和  java中 bean public 属性差不多

  print('----------------operator操作符---------------------');

  final v1 = Vector(2, 3);
  final v2 = Vector(2, 2);
  final r1 = v1 + v2;
  final r2 = v1 - v2;
  print([r1.x, r1.y]);
  print([r2.x, r2.y]);
  print("----------------多态-------------------");
  Message message = MessageFactory('foot');
  message.doMessage();
}

//有载操作符
class Vector {
  final int x;
  final int y;

  const Vector(this.x, this.y);

//重载 +
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }

//重载 -
  Vector operator -(Vector v) {
    return new Vector(x - v.x, y - v.y);
  }
}

//工厂函数
class Message {
  void doMessage() {
    print('按摩');
  }
}

class FootMessage implements Message {
  @override
  doMessage() {
    print('脚底按摩');
  }
}

class BodyMessage implements Message {
  @override
  void doMessage() {
    print('全身按摩');
  }
}

class SpecialMessage implements Message {
  @override
  void doMessage() {
    print('特殊按摩');
  }
}

Message MessageFactory(String type) {
  switch (type) {
    case 'foot':
      return new FootMessage();
    case 'body':
      return new BodyMessage();
    case 'special':
      return new SpecialMessage();
  }
}

class Rectangle {
  num left;
  num top;
  num width;
  num height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width; //这里需要做下区分

  set right(num value) => left = value - width;

  num get bottom => top + height;

  set bottom(num value) => top = value - height;
}

class Singleton {
  String name;

  //工厂构造函数无法访问this，所以这里要用static
  static Singleton _cache;

  //工厂方法构造函数，关键字factory
  factory Singleton([String name = 'singleton']) =>
      Singleton._cache ??= Singleton._newObject(name);

  //定义一个命名构造函数用来生产实例
  Singleton._newObject(this.name);
}

class Point2 {
  //定义const构造函数要确保所有实例变量都是final
  final num x;
  final num y;
  static final Point2 origin = const Point2(0, 0);

  //const关键字放在构造函数名称之前，且不能有函数体
  const Point2(this.x, this.y);

  void printX() {
    print('定义const构造函数: ' + x.toString() + '  ' + y.toString());
  }
}

class Parent {
  int x;
  int y;

  //父类命名构造函数不会传递 , 其实就是不能在子类中直接调用 , 像java中直接用子类掉父类的方法
  Parent.fromJson(x, y)
      : x = x,
        y = y {
    print('继承: 父类命名构造函数x=$x y=$y');
  }
}

class Child extends Parent {
  int x;
  int y;

  //若超类没有默认构造函数， 需要手动调用超类其他构造函数
  Child(x, y) : super.fromJson(x, y) {
    //调用父类构造函数的参数无法访问 this
    print('继承:1 子类构造函数x=$x y=$y');
  }

  //你在子类中不写这个是不能调用的 , 想要用就写一个一样的
  //在构造函数的初始化列表中使用super()，需要把它放到最后
  Child.fromJson(x, y)
      : x = x,
  //先赋值然后调用父类
        y = y,
        super.fromJson(x, y) {
    print('继承:2 子类命名构造函数x=$x y=$y');
  }
}
