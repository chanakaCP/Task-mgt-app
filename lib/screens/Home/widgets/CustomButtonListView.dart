import 'package:flutter/material.dart';

class CustomButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: 100,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
          Container(
            width: 160.0,
            color: Colors.pink,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
