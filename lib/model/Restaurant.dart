import 'dart:convert';

Restaurants restaurantsFromJson(String str) => Restaurants.fromJson(json.decode(str));

String restaurantsToJson(Restaurants data) => json.encode(data.toJson());

class Restaurants {
  Restaurants({
    this.message,
    this.restaurants,
    this.status,
  });

  String message;
  List<Restaurant> restaurants;
  int status;



  factory Restaurants.fromJson(Map<String, dynamic> json) {
    return Restaurants(
    message: json["message"],
    restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
    status: json["status"],
  );
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
    "message": message,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
    "status": status,
  };
  }
}

class Restaurant {
  Restaurant({
    this.id,
    this.stateId,
    this.cityId,
    this.zoneId,
    this.concernPerson,
    this.ownerMobile,
    this.storeName,
    this.storeMobile,
    this.storeAddress,
    this.storeEmail,
    this.gstNo,
    this.storeLat,
    this.storeLng,
    this.storeImage,
    this.storeLogo,
    this.storeMenuImg,
    this.kycFile,
    this.cancelledCheck,
    this.startTime,
    this.endTime,
    this.storeStatus,
    this.stypeId,
    this.pancardNo,
    this.pancardFile,
    this.registerStatus,
    this.state,
    this.cityName,
    this.zoneName,
    this.permanentCloseStatus,
    this.closeStatus,
    this.distance,
  });

  String id;
  String stateId;
  String cityId;
  String zoneId;
  String concernPerson;
  String ownerMobile;
  String storeName;
  String storeMobile;
  String storeAddress;
  String storeEmail;
  String gstNo;
  String storeLat;
  String storeLng;
  String storeImage;
  String storeLogo;
  String storeMenuImg;
  String kycFile;
  String cancelledCheck;
  String startTime;
  String endTime;
  String storeStatus;
  String stypeId;
  String pancardNo;
  String pancardFile;
  String registerStatus;
  String state;
  String cityName;
  String zoneName;
  int permanentCloseStatus;
  int closeStatus;
  int distance;





  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    zoneId: json["zone_id"],
    concernPerson: json["concern_person"],
    ownerMobile: json["owner_mobile"],
    storeName: json["store_name"],
    storeMobile: json["store_mobile"],
    storeAddress: json["store_address"],
    storeEmail: json["store_email"],
    gstNo: json["gst_no"],
    storeLat: json["store_lat"],
    storeLng: json["store_lng"],
    storeImage: json["store_image"],
    storeLogo: json["store_logo"],
    storeMenuImg: json["store_menu_img"],
    kycFile: json["kyc_file"],
    cancelledCheck: json["cancelled_check"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    storeStatus: json["store_status"],
    stypeId: json["stype_id"],
    pancardNo: json["pancard_no"],
    pancardFile: json["pancard_file"],
    registerStatus: json["register_status"],
    state: json["state"],
    cityName: json["city_name"],
    zoneName: json["zone_name"],
    permanentCloseStatus: json["permanent_close_status"],
    closeStatus: json["close_status"],
    distance: json["distance"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "state_id": stateId,
    "city_id": cityId,
    "zone_id": zoneId,
    "concern_person": concernPerson,
    "owner_mobile": ownerMobile,
    "store_name": storeName,
    "store_mobile": storeMobile,
    "store_address": storeAddress,
    "store_email": storeEmail,
    "gst_no": gstNo,
    "store_lat": storeLat,
    "store_lng": storeLng,
    "store_image": storeImage,
    "store_logo": storeLogo,
    "store_menu_img": storeMenuImg,
    "kyc_file": kycFile,
    "cancelled_check": cancelledCheck,
    "start_time": startTime,
    "end_time": endTime,
    "store_status": storeStatus,
    "stype_id": stypeId,
    "pancard_no": pancardNo,
    "pancard_file": pancardFile,
    "register_status": registerStatus,
    "state": state,
    "city_name": cityName,
    "zone_name": zoneName,
    "permanent_close_status": permanentCloseStatus,
    "close_status": closeStatus,
    "distance": distance,
  };
}