import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPgae extends StatefulWidget {
  LoginPgae({Key key}) : super(key: key);

  _LoginPgaeState createState() => _LoginPgaeState();
}

class _LoginPgaeState extends State<LoginPgae> {
  TextEditingController usernameCtrl = TextEditingController(text: 'user@emial.com');
  TextEditingController passwordCtrl = TextEditingController(text: '123456');
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays ([]);
    return Scaffold(
      
      // backgroundColor: Color(0xFF3148E3).withAlpha(100),
      body: ListView(
        // physics: NeverScrollableScrollPhysics(),
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 30),
                height: 404,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Log in', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                    Text('to your account', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text('User name Email', style: TextStyle(color: Colors.grey[100]),),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.person, color: Colors.grey,),
                          Expanded(
                            child: TextField(
                              controller: usernameCtrl,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Password', style: TextStyle(color: Colors.grey[100]),),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.lock, color: Colors.grey,),
                          Expanded(
                            child: TextField(
                              obscureText: true,
                              controller: passwordCtrl,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                filled: true,
                  
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){},
                          child: Text('Forgot Password?', style: TextStyle(color: Colors.white),),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: -20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
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
                            onTap: () async{
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool('logined', true);
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              color: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text('Log in', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                            )
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ),
              Positioned(
                right: 20,
                top: 60,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close, color: Colors.white,),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [BoxShadow(color: Color(0xFF2B49E7).withAlpha(50), blurRadius: 10, spreadRadius: 5, offset: Offset(0, 10))]
            ),
            child: Material(
              color: Color(0xFF2B49E7),
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(40),
              child: InkWell(
                onTap: (){},
                child: Center(
                  heightFactor: 2.4,
                  child: Text('New User? Register Here', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Privacy', style: TextStyle(fontWeight: FontWeight.bold),),
                Text('Terms of Use', style: TextStyle(fontWeight: FontWeight.bold),),
                Text('About App', style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          )
        ],
      ),
    );
  }
}