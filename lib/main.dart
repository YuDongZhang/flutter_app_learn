import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text('你好'),
          ),
          body: TestContainer(),
        ));
  }
}

class TestContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          RowWidget(),
          CenterWidget(),
        ],
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 120,
          child: Text(
            '你好',
            style: TextStyle(fontSize: 36, color: Colors.black),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 10, right: 5, top: 50, bottom: 10),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.blue,
            width: 10,
          )),
        ),
        Container(
          child: Text('我好'),
        )
      ],
    );
  }
}

class CenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.pink, width: 2)),
      margin: EdgeInsets.all(10),
      child: Center(
        child: Text('我是center'),
      ),
    );
  }
}
