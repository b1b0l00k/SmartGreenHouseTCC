import 'package:flutter/material.dart';

class SearchDetail extends StatefulWidget {
  SearchDetail({Key key}) : super(key: key);

  _SearchDetailState createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E8F1),
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50, left: 50, right: 20, bottom: 10),
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Paris, France', style: TextStyle(color: Colors.white),),
                        Text('London, UK', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    RaisedButton(
                      color: Colors.white,
                      child: Text('Filter'),
                      onPressed: (){},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  physics: ClampingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (c, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(color: Color(0x11000000), blurRadius: 4, spreadRadius: 4, offset: Offset(0, 4))]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F4FB),
                              border: Border.all(color: Colors.blue, width: 1)
                            ),
                            child: Column(
                              children: <Widget>[
                                Text('BRITISH AIRWAYS'),
                                Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text('04:55'),
                                        Text('Paris')
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text('05:55'),
                                        Text('London')
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 6,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('\$500', style: TextStyle(color: Colors.blueAccent),),
                              RaisedButton(
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                onPressed: (){},
                                child: Text('Select', style: TextStyle(color: Colors.white),),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          )
        ],
      )
    );
  }
}