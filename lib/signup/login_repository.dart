import 'dart:convert';

import 'package:bondu/home/response_body/profile_model.dart';
import 'package:bondu/home/response_body/update_profile_model.dart';
import 'package:bondu/main_service/response_model/service_list_model.dart';
import 'package:bondu/main_service/response_model/service_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../chat/model/incomming_message_model.dart';
import '../chat/model/message_sent_model.dart';
import '../chat/model/message_userlist_model.dart';
import '../http-service/api_response.dart';
import '../http-service/http-service.dart';
import '../locator/locator.dart';
import '../utils/api-cosntant.dart';
import 'model/login_response.dart';
import 'model/signinup_response.dart';
import 'model/user_login_model.dart';

class LoginRepository{

  var _httpService = locator<HttpService>();

  Future<ApiResponse<UserLoginModel?>> userLogin(String email,String password) async {

    var apiResponse = await _httpService.postRequest(APICONSTANT.SERVER+APICONSTANT.LOGIN,
        data: {
          "user":email,
          "password":password.toString()


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
        data:UserLoginModel.fromJson(apiResponse.data.data)
    );

  }


  Future<bool> userLogout() async {


    var apiResponse = await _httpService.postRequest(APICONSTANT.SERVER+APICONSTANT.LOGOUT);
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


  Future<ApiResponse<ServiceResponseModel>> postService(data) async {

    var apiResponse = await _httpService.postRequest(APICONSTANT.SERVER+APICONSTANT.POSTSERVICE,
        data: data.toJson()
    );

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: ServiceResponseModel.fromJson(apiResponse.data.data)
    );

  }

  Future<ApiResponse<UpdateProfileModel>> updateProfile(data,id) async {

    var apiResponse = await _httpService.postRequest(APICONSTANT.SERVER+APICONSTANT.UPDATEPROFILE+"${id}",
        data: data,
    );

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: UpdateProfileModel.fromJson(apiResponse.data.data)
    );

  }

  Future<ApiResponse<UpdateProfileModel>> uploadImage(data,id) async {

    var apiResponse = await _httpService.uploadImage(APICONSTANT.SERVER+APICONSTANT.UPDATEPROFILE+"${id}",data);

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: UpdateProfileModel.fromJson(apiResponse.data.data)
    );

  }

  Future<ApiResponse<ProfileInfoModel>> getProfileInfo(String id) async {

    var apiResponse = await _httpService.getRequest(APICONSTANT.SERVER+APICONSTANT.PROFILEINFO+"/${id}",
    );

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: ProfileInfoModel.fromJson(apiResponse.data.data)
    );

  }
  Future<ApiResponse<ServiceList>> getServiceList() async {
    var apiResponse = await _httpService.getRequest(APICONSTANT.SERVER+APICONSTANT.SERVICELIST,
    );
    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: ServiceList.fromJson(apiResponse.data.data)
    );

  }

  Future<ApiResponse<List<MessengerUserListModel>>> getMessageUserList() async {
    var apiResponse = await _httpService.getRequest(APICONSTANT.SERVER+APICONSTANT.MESSAGEUSER,);
    List<MessengerUserListModel> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            MessengerUserListModel.fromJson(element),
          );
        },
      );
    }
    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: list
    );

  }

  Future<ApiResponse<MessageSendResponseModel>> sendMessage(data) async {

    var apiResponse = await _httpService.postRequest(APICONSTANT.SERVER+APICONSTANT.MESSAGESENT,
        data: data.toJson()
    );

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: MessageSendResponseModel.fromJson(apiResponse.data.data)
    );

  }

  Future<ApiResponse<List<IcomingMessageModel>>> getIncommingMessage(id) async {
    var apiResponse = await _httpService.getRequest(APICONSTANT.SERVER+APICONSTANT.INCOMMINGMESSAGE+"/${id}",);
    List<IcomingMessageModel> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            IcomingMessageModel.fromJson(element),
          );
        },
      );
    }
    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: list
    );

  }




}