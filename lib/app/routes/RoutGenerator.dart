import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_app/app/screens/home.dart';
import 'package:flutter_api_app/app/screens/login.dart';

import '../../main.dart';

final routes = {
  '/login':         (BuildContext context) => new Login(),
  '/home':         (BuildContext context) => new MyHomePage(),
  '/' :          (BuildContext context) => new Login(),
};