  import 'package:flutter/material.dart';

Widget search(){
  return Padding(
  padding: EdgeInsets.only(right: 8.0,left: 8.0 ,bottom: 8.0),
  child: Card(
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(15.0),
  ),
  elevation: 10 ,
  child: Padding(
  padding: EdgeInsets.only(right: 8.0,left: 32.0,top: 8.0,bottom: 8.0),
  child:  Row(children: [Padding(padding: EdgeInsets.only(right: 50.0,left: 32.0),child: Text("Search ")), Icon(Icons.search,color: Colors.black,)],),
  ),
  ),
  ) ;
  }

