main() {
  //递归生成器
  //同步
  var it1 = getSyncRecursiveGenerator(5).iterator;
  while (it1.moveNext()) {
    print(it1.current);
  }
}

//递归生成器：使用yield*
Iterable<int> getSyncRecursiveGenerator(int n) sync* {
  if (n > 0) {
    yield n;
    yield* getSyncRecursiveGenerator(n - 1);
  }
}
