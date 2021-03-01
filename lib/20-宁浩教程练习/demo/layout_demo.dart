import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,//主轴
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconBadge(Icons.pool),
          IconBadge(Icons.beach_access,size: 60,),
          IconBadge(Icons.airport_shuttle),
        ],
      ),
    );
  }

}

class IconBadge extends StatelessWidget{
  final IconData icon;
  final double size;

  IconBadge(this.icon,{this.size = 32.0});//这种就是有默认值的 size

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon,size: size,color: Colors.white,),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }

}