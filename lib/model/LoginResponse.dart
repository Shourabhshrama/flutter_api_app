class LoginResponse{
    String message;

    int status;
    LoginResponse({this.message,   this.status} );

    factory  LoginResponse.fromJson(Map<String,dynamic> json){
      return  LoginResponse(
          message: json["message"],

          status: json["status"],
      );
    }

  Future<Map<String,dynamic>>   toJson() async{
      return {
        "message": message,

        "status": status
      };
    }
}


