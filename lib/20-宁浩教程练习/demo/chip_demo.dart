import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon',
  ];

  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              //包装之后里面的 chip 是可以换行
              spacing: 8.0, //小部件之间的间隔
              runSpacing: 8.0, //行与行之间的间隔
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Wanghao'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('皓'),
                  ),
                ),
                Chip(
                  label: Text('Wanghao'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://resources.ninghao.net/images/wanghao.jpg'
                    ),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this tag',
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon',
            ];

            _selected = [];

            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}