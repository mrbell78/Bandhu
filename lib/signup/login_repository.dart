import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../http-service/api_response.dart';
import '../http-service/http-service.dart';
import '../locator/locator.dart';
import '../utils/api-cosntant.dart';
import 'model/signinup_response.dart';

class LoginRepository{

  var _httpService = locator<HttpService>();

  Future<ApiResponse<CustommerLogin?>> userLogin(String userName, String phone,String email) async {

    var apiResponse = await _httpService.postRequest(APICONSTANT.SERVER+APICONSTANT.REGISTRATION_POST,
        data: {
          "name":userName,
          "phone":phone.toString(),
          "email":email,
          "role" : "user"
        }
    );

    if(apiResponse.httpCode==200){
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('logininfo', jsonEncode(apiResponse.data.data)).then((value) {
        print("login info saved");
      });


    }
    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:CustommerLogin.fromJson(apiResponse.data.data)
    );

  }


  Future<bool> userLogout(String token) async {


    var apiResponse = await _httpService.postRequesturlencoded(APICONSTANT.SERVER+APICONSTANT.LOGOUT,token: token);
    print("the respons is ${apiResponse}");
    return true;
    // if(apiResponse.httpCode==200){
    //   return true;
    // }else return false;
    // return ApiResponse(
    //     httpCode: apiResponse.httpCode,
    //     message: apiResponse.message,
    //     data:CustommerLogin.fromJson(apiResponse.data.data)
    // );

  }


  // Future<ApiResponse<dynamic>> postRegistration(BodyRegistrationData data) async {
  //
  //   var apiResponse = await _httpService.postRequest(ApiConstant.SERVER+ApiConstant.REGISTRATION_POST,
  //       data: data.toJson()
  //   );
  //
  //   return ApiResponse(
  //       httpCode: apiResponse.httpCode,
  //       message: apiResponse.message,
  //       data: apiResponse.data.data
  //   );
  //
  // }


}