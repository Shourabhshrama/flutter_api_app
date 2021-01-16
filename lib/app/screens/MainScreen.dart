import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';



class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

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

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyApp(),
    );

  }

}
class MyApp extends StatefulWidget {
@override
_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  int  _currentIndex=0;
   List listPages=[
     MyHomePage(),
     Text("Profile"),
   ];


  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar( actions: [ _searchAction,_cartAction],
      //     title: Text(""), backgroundColor: Colors.white),
      body: Center(child: listPages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items:  _bottomNavigationItem,
      ),
    );
  }


  get _bottomNavigationItem => [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),

    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile')
    )
  ];
}



