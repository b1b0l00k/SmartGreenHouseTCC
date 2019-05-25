import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flight/login.dart';

class HomeSearchForm extends StatefulWidget {
  HomeSearchForm({Key key}) : super(key: key);

  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<HomeSearchForm> {
  String dropValue = 'Adults';
  String dropValue1 = 'Children';
  bool checkValue = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [BoxShadow(color: Color(0x11000000), blurRadius: 5, spreadRadius: 4)]
      ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           line1(),
           SizedBox(height: 10,),
           line2(),
            SizedBox(height: 10,),
           line3(),
           SizedBox(height: 10,),
           line4(),
           SizedBox(height: 10,),
           Container(
             padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFC44C98), width: 1, style: BorderStyle.solid),
                color: Colors.blueAccent.withAlpha(30),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text('Apply Coupon Code', style: TextStyle(color: Color(0xFFC44C98)),),
              ),
           ),
           SizedBox(height: 10,),
           Row(
             children: <Widget>[
                Checkbox(
                  value: checkValue, 
                  onChanged: (v) {
                    setState(() {
                      checkValue = v;
                    });
                  },
                ),
                Text('Non Stop Flights only')
             ],
           ),
           SizedBox(height: 10,),
           button()
         ],
       ),
    );
  }
  Widget button () {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF3148E3),
            Color(0xFFCC2D8C)
          ]
        ),
        boxShadow: [BoxShadow(color: Colors.blue.withAlpha(60), blurRadius: 15, spreadRadius: 10, offset: Offset(0, 5))]
      ),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            var loginStatus = prefs.getBool('logined') ?? false;
            if (loginStatus) Navigator.of(context).pushNamed('detail');
            else {
              Navigator.of(context).push(MaterialPageRoute(builder: (c) => LoginPgae(), fullscreenDialog: true));
            }
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text('Search Flight', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
          )
        ),
      ),
    );
  }
  Widget line4 () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RaisedButton(
          color: Colors.blue[50],
          elevation: 0,
          onPressed: (){},
          child: Text('Economy', style: TextStyle(color: Colors.blue[900]),),
        ),
        RaisedButton(
          color: Colors.blue[700],
          elevation: 0,
          onPressed: (){},
          child: Text('Buslness', style: TextStyle(color: Colors.white),),
        ),
        RaisedButton(
          color: Colors.blue[50],
          elevation: 0,
          onPressed: (){},
          child: Text('First Class', style: TextStyle(color: Colors.blue[900]),),
        ),
      ],
    );
  }
  Widget line3 () {
    return Row(
      children: <Widget>[
        Expanded(
          child: DropdownButton(
            value: dropValue,
            onChanged: (v){
              setState(() {
                dropValue = v;
              });
            },
            items: [
              DropdownMenuItem(value: 'Adults', child: Text('Adults'),),
              DropdownMenuItem(value: 'Adults1', child: Text('Adults1'),)
            ],
          ),
        ),
        Container(
          width: 64,
        ),
        Expanded(
          child: DropdownButton(
            value: dropValue1,
            onChanged: (v){
              setState(() {
                dropValue1 = v;
              });
            },
            items: [
              DropdownMenuItem(value: 'Children', child: Text('Children'),),
              DropdownMenuItem(value: 'Children1', child: Text('Children1'),)
            ],
          ),
        ),
      ],
    );
  }
  Widget line2 () {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Departure'
            ),
          ),
        ),
        Container(
          width: 64,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Return'
            ),
          ),
        ),
      ],
    );
  }
  Widget line1 () {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'From'
            ),
          ),
        ),
        SizedBox(width: 10,),
        Transform.rotate(
          angle: pi/2,
          child: CircleAvatar(
            backgroundColor: Colors.blue[50],
            child: Icon(Icons.flight),
          ),
        ),
        SizedBox(width: 14,),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'To'
            ),
          ),
        ),
      ],
    );
  }
}