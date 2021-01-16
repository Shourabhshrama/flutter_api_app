class OtpResponse{
    String message;
    UserData userData;
    int status;
    OtpResponse({this.message, this.userData, this.status} );

    factory  OtpResponse.fromJson(Map<String,dynamic> json){
      return  OtpResponse(
          message: json["message"],
          userData : UserData.fromJson(json["user_data"]) ,
          status: json["status"],
      );
    }

  Future<Map<String,dynamic>>   toJson() async{
      return {
        "message": message,
        "user_data": userData.toJosn(),
        "status": status
      };
    }
}


class UserData{
  String id;
 String firstName;
 String lastName;
 String email;
 String mobileNo;
 String stateID;
 String cityID;
 String zoneID;
 String acceptTc;
 String deliveryLocation;
 String dateCreated;

  UserData(
  {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.mobileNo,
      this.stateID,
    this.cityID,
      this.zoneID,
      this.acceptTc,
      this.deliveryLocation,
      this.dateCreated});

  factory UserData.fromJson(Map<String,dynamic> json){
    return UserData(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      mobileNo: json["mobile_no"],
      stateID: json["state_id"],
      zoneID: json["zone_id"],
      cityID: json["city_id"],
      acceptTc: json["accept_tc"],
      deliveryLocation: json["delivery_location"],
      dateCreated: json["date_created"],
    );
  }


  Map<String,dynamic> toJosn(){
    return{
      "id":  id,
      "first_name":  firstName,
      "last_name":  lastName,
      "email":  email,
      "mobile_no":  mobileNo,
      "state_id":  stateID,
      "zone_id":  zoneID,
      "city_id":  cityID,
      "accept_tc":  acceptTc,
      "delivery_location":  deliveryLocation,
      "date_created":  dateCreated,
    };
  }
}