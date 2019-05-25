import 'package:flutter/material.dart';
import 'package:flight/login.dart';
import 'package:flight/home.dart';
import 'package:flight/detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        'detail': (c) => SearchDetail(),
        'login': (c) => LoginPgae()
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageCtrl = PageController(initialPage: 0);
  int pageIndex = 0;
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: _pageCtrl,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (c, index){
                if (index ==0 ){
                  return HomePage();
                }
                return Center(child: Text('Page $index'),);
              },
            )
          ),
          SafeArea(
            top: false,
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.home, size: 24, color: activeTab == 0 ? Colors.blue : Colors.grey),
                        ),
                        onTap: (){
                          _onTabTap(0);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.book, size: 24,color: activeTab == 1 ? Colors.blue : Colors.grey),
                        ),
                        onTap: (){
                          _onTabTap(1);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.email, size: 24,color: activeTab == 2 ? Colors.blue : Colors.grey),
                        ),
                        onTap: (){
                          _onTabTap(2);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.person, size: 24,color: activeTab == 3 ? Colors.blue : Colors.grey),
                        ),
                        onTap: (){
                          _onTabTap(3);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  _onTabTap(int index) {
    _pageCtrl.jumpToPage(index);
    setState(() {
      activeTab = index;
    });
  }
}
