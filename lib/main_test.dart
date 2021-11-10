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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              left: 150.0,
              top: 20.0,
              child: CircularProgressIndicator(
//                    value: 0.3,
                backgroundColor: Color(0xffff0000),
              )),
          Positioned(
              left: 150.0,
              top: 70.0,
              child: CircularProgressIndicator(
                value: 0.3,
                backgroundColor: Color(0xffff0000),
              )),
          Positioned(
              left: 150.0,
              top: 120.0,
              child: CircularProgressIndicator(
//                    value: 0.3,
                strokeWidth: 4.0,
                backgroundColor: Color(0xffff0000),
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
              )),
          Positioned(
              left: 150.0,
              top: 170.0,
              child: CircularProgressIndicator(
//                    value: 0.3,
                strokeWidth: 8.0,
                backgroundColor: Color(0xffff0000),
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
              )),
          Positioned(
              left: 150.0,
              top: 220.0,
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
//                    value: 0.3,
                  backgroundColor: Color(0xffff0000),
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              )),
          Positioned(
              top: 300,
              child: Text(
                '老孟，一枚有态度的程序员。欢迎关注他的公众有态度的程序员。欢迎关注他的公众有态度的程序员。欢迎关注他的公众号',
                softWrap: true,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
