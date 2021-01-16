import 'dart:convert';

import 'package:flutter_api_app/model/CityResponse.dart';
import 'package:flutter_api_app/model/LoginResponse.dart';
import 'package:flutter_api_app/model/OtpResponse.dart';
import 'package:flutter_api_app/model/Restaurant.dart';
import "package:http/http.dart" as http;

class ApiProvider {
  final String _urlBase = "http://www.rinto.in/Api/";

  Future<List<Restaurant>> getRestaurant(
      String user_id, String service_type) async {
    String endPoint = "get_restaurants";
    // Map<String, String> headerParams = {
    //   "Content-Type": 'application/json',
    //   "user_id": user_id,
    //   "service_type": service_type,
    // };

    final responseJson = await http.post(_urlBase + endPoint,
        body: {'user_id': user_id, 'service_type': service_type});

    // print("end point   ${_urlBase+endPoint}   ${headerParams}");

    if (responseJson.statusCode == 200) {
      var data = responseJson.body;

      var RestaurantsData = Restaurants.fromJson(jsonDecode(data));

      return RestaurantsData.restaurants;
    } else {
      return List<Restaurant>();
    }
  }

  Future<LoginResponse> getUSerData(String phone) async {
    String endPoint = "login";

    final responseJson =
        await http.post(_urlBase + endPoint, body: {'user_id': phone});

    // print("end point   ${_urlBase+endPoint}   ${headerParams}");

    if (responseJson.statusCode == 200) {
      var data = responseJson.body;

      var data2 = LoginResponse.fromJson(jsonDecode(data));

      return data2;
    } else {
      return LoginResponse();
    }
  }

  Future<OtpResponse> getOtp(String phone, String opt) async {
    String endPoint = "verify_otp";

    final responseJson = await http
        .post(_urlBase + endPoint, body: {'mobile_number': phone, 'otp': opt});

    print("mobile_number     $phone  ");
    print("otp    $opt    ");
    print("response    ${_urlBase + endPoint}   ${responseJson.body}");

    if (responseJson.statusCode == 200) {
      var data = responseJson.body;

      var data2 = OtpResponse.fromJson(jsonDecode(data));

      return data2;
    } else {
      return OtpResponse();
    }
  }

 Future<CityResponse> checkCity(String city) async {
    String endPoint = "check_available_cities";
  var  cityResponse= await http.post(_urlBase + endPoint, body: {'city_name': city});

  print("cityResponse $cityResponse");

  if(cityResponse.statusCode==200){
    var data = cityResponse.body;

    var data2 = CityResponse.fromJson(jsonDecode(data));

    return data2;
  }
  else{
    CityResponse();
  }
  }
}

