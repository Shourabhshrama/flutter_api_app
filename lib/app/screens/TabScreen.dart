import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: MaterialApp(
        
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Let\'s parse some JSON'),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Basics'),
                Tab(text: 'Conv. Simple'),
                Tab(text: 'Conv. Complex'),
                Tab(text: 'Conv. List'),
                Tab(text: 'Ser. Simple'),
                Tab(text: 'Ser. Complex'),
                Tab(text: 'Ser. List'),
                Tab(text: 'Built Simple'),
                Tab(text: 'Built Complex'),
                Tab(text: 'Built List'),
              ],
            ),
          ),
          body: SafeArea(
            bottom: false,
            child: TabBarView(
              children: [
                Text("BasicsPage") ,
                Text("ConvertedSimplePage") ,
                Text("ConvertedComplexPage") ,
                Text("ConvertedListPage") ,
                Text("SerializableSimplePage") ,
                Text("SerializableComplexPage") ,
                Text("SerializableListPage") ,
                Text("BuiltSimplePage") ,
                Text("BuiltComplexPage") ,
                Text("BuiltListPage") ,


              ],
            ),
          ),
        ),
      ),
    );
  }
}