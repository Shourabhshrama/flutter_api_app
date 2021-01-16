

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_app/app/screens/MainScreen.dart';
import 'package:flutter_api_app/app/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/screens/TabScreen.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var phone = prefs.getString('id');
  phone == null ? runApp( Login()  )  : runApp(MainScreen());

}

// main(){
//   runApp(MyHomePage());
// }



