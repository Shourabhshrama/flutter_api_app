import 'package:flutter/foundation.dart';

class CityResponse {
  int status;
  String message;

  CityResponse({this.status, this.message});

  factory CityResponse.fromJson(Map<String, dynamic> json){
    return CityResponse(
        status: json['status'],
        message: json['message']
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
      'status': status,
      'message': message
    };
  }
}
