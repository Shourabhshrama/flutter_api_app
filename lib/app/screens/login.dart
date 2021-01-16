import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../ApiProvider.dart';
import 'Otp_screen.dart';
import 'home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        '/otp': (context) => OtpScreen(),
      },
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
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPAgeState();
}

class LoginPAgeState extends State<LoginPage> {
  var isLoading = false;
  var isError = false;
  var errorText = "something went wrong";
  final _formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 124.0),
                child: Text(
                  "Login Page",
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter phone number'),
                  validator: (value) {
                    if (value.isEmpty ||
                        !RegExp(r"^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$")
                            .hasMatch(value)) {
                      return 'Please enter correct phone number';
                    }
                    return null;
                  },
                ),
              ),
              isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()))
                  : loginBtn(),
              isError
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        errorText,
                        style: TextStyle(color: Colors.redAccent),
                      )))
                  : Text("")
            ],
          ),
        ),
      ),
    );
  }

  Widget loginBtn() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        //     disabledColor: Colors.red,
        // disabledTextColor: Colors.black,
        padding: const EdgeInsets.all(20),
        textColor: Colors.white,
        color: Colors.green,
        onPressed: _handleSubmitted,

        child: Text('Login'),
      ),
    );
  }

  void _handleSubmitted() async {
    setState(() {
      isLoading = true;
    });
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      setState(() {
        isLoading = false;
      });
    } else {
      form.save();
      var _apiResponse = await ApiProvider().getUSerData(phoneController.text);
      if (_apiResponse.status == 1) {
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString("id", _apiResponse.userData.id);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('phone', phoneController.text);
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/otp',
          ModalRoute.withName('/otp'),
        );
      } else {
        setState(() {
          isLoading = false;
          isError = true;
          errorText = _apiResponse.message;
        });

        Timer(Duration(seconds: 4), _callbackError());
      }
    }
  }

    _callbackError() {
    setState(() {
      isError = false;
    });
  }
}
