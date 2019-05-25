import 'package:flutter/material.dart';

typedef void OnPressed(int);
class SegmentControl extends StatelessWidget {
  final int active;
  final OnPressed onPressed;
  const SegmentControl({Key key, this.active, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          getButton('One Way', 0),
          getButton('Round Trip', 1),
          getButton('Multi-City', 2),
        ],
      ),
    );
  }
  Widget getButton (String title, int index) {
    if (active == index) {
      return RaisedButton(
        color: Color(0xFF3148E3),
        elevation: 0,
        onPressed: () => onPressed(index),
        child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      );
    }
    return RaisedButton(
      color: Colors.white,
      elevation: 0,
      onPressed: () => onPressed(index),
      child: Text(title),
    );
  }
}