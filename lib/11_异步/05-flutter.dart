void main() {
  var data = fetchUserData();
  //其实这个返回的是一个 flutter
  data.then((value) {
    print(value);
  }).catchError((e) {
    print(e);
  });



}

Future<String> fetchUserData() {
  return Future.delayed(Duration(seconds: 2), () {
    // 模拟成功
    return 'Hello from Network';
    // 模拟失败
    // throw Exception('Network Error');
  });
}