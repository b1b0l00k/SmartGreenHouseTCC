import 'package:flutter/material.dart';
import 'package:flight/multibuttons.dart';
import 'package:flight/searchform.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int active = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF8542B9),
                        Color(0xFF3148E3),
                        Color(0xFFCC2D8C)
                      ]
                    )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60, left: 20, right: 20),
                // height: 500,
                child: Column(
                  children: <Widget>[
                    SegmentControl(
                      active: active,
                      onPressed: (index) async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.remove('logined');
                        setState(() {
                          active = index;
                        });
                      },
                    ),
                    HomeSearchForm()
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

