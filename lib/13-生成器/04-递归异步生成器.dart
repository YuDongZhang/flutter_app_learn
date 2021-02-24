main() {
  //递归生成器
   getAsyncRecursiveGenerator(5).listen((value) => print(value));
}

//异步递归生成器
Stream<int> getAsyncRecursiveGenerator(int n) async* {
  if (n > 0) {
    yield n;
    yield* getAsyncRecursiveGenerator(n - 1);
  }
}
