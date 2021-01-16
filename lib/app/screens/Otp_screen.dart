import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

import '../ApiProvider.dart';
import 'MainScreen.dart';


class OtpScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()  => OtpState();

}

class OtpState extends State<OtpScreen>{

  int _otpCodeLength=4;

  bool _isLoadingButton = false;
  bool _isError = false;
  bool _enableButton = false;
  String _otpCode = "";
  String _errorMesssage = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _getSignatureCode();
    super.initState();
  }
  @override
  void dispose() {

    super.dispose();
  }

  _getSignatureCode() async {
    String signature = await SmsRetrieved.getAppSignature();
    print("signature $signature");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: const Text('Verify Otp'),
      ),
      body: Center(
        child: Column(
          children: [

            SizedBox.fromSize(size: Size(300, 300),),
              TextFieldPin(
              filled: true,
              filledColor: Colors.grey[100],
              codeLength: _otpCodeLength,

              boxSize: 48,
              onOtpCallback: (code, isAutofill) =>
                  onOtpCallBack(code, isAutofill),
            ),
            SizedBox.fromSize(size: Size(10, 10),),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.all(10.0),
              child: MaterialButton(
                onPressed: _enableButton ? _onSubmitOtp : null,
                child: _setUpButtonChild(),
                color: Colors.blue,
                disabledColor: Colors.blue[100],
              ),
            ),
            SizedBox.fromSize(size: Size(10, 10),),
            _isError?Container(

              margin: EdgeInsets.all(10.0),
              child: Text(_errorMesssage, style: TextStyle(
                color: Colors.red
              ),



              ),
            ):Text("")
          ],




        ),

      ),


    );



     }

  _onSubmitOtp() {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode();
    });
  }

 void onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        _verifyOtpCode();
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }
  Widget _setUpButtonChild() {
    if (_isLoadingButton) {
      return Container(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        "Verify",
        style: TextStyle(color: Colors.white),
      );
    }
  }


  _verifyOtpCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FocusScope.of(context).requestFocus(new FocusNode());
    Timer(Duration(milliseconds: 4000), () {

    ApiProvider().getOtp(prefs.getString("phone"),_otpCode).then((value) {
        if(value.status==1){
          setState(() async {
            _isLoadingButton = false;
            _enableButton = false;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('id', value.userData.id);
            Navigator.push(context, MaterialPageRoute(builder:  (context) => MainScreen(),));
          });
        }else{
          setState(() {
            _isLoadingButton = false;
            _isError=true;
            _enableButton = true;
            _errorMesssage=value.message;
          });
        }
    });



    });
  }
  }




