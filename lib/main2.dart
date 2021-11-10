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
      home: RowToRowPage(),
    );
  }
}

class RowToRowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hhhh'),
      ),
      body: Container(
        color: Colors.orangeAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: Colors.green,
                    child: Text('绿Container'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          color: Colors.purple, child: Text('紫Container')),
                      Container(color: Colors.red, child: Text('红Container')),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              child: Text('蓝Container'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnToColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("widget"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      child: Text('hhhh'),
                    ),
                    Container(
                      child: Text('heheh'),
                    )
                  ],
                ),
              ),
              Container(
                height: 100,
                color: Colors.blue,
              )
            ],
          ),
        ));
  }
}
