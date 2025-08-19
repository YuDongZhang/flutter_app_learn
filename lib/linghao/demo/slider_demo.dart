import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Slider(
                  value: _sliderItemA,
                  onChanged: (value) {
                    setState(() {
                      _sliderItemA = value;
                    });
                  },
                  activeColor: Theme.of(context).colorScheme.secondary,//活动状态下的颜色
                  inactiveColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),//没有活动状态下的颜色
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,//分隔成指定的份数
                  label: '${_sliderItemA.toInt()}',
                ),
              ],
            ),
            SizedBox(height: 16.0,),
            Text('SliderValue: $_sliderItemA'),
          ],
        ),
      )
    );
  }
}