

import 'dart:io';

import 'package:bondu/home/response_body/update_profile_model.dart';
import 'package:bondu/main_service/response_model/service_list_model.dart';
import 'package:bondu/main_service/response_model/service_list_model.dart' as srlist;
import 'package:bondu/main_service/response_model/service_response_model.dart';
import 'package:bondu/signup/model/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../locator/locator.dart';
import 'login_repository.dart';
import 'model/signinup_response.dart';
import 'model/user_login_model.dart';

class CustommerLoginController extends ChangeNotifier{

  var _login_repo = locator<LoginRepository>();

  CustommerRegistration ?custommerLogin;
  UserLoginModel?userLogin;
  ServiceResponseModel ? serviceResponseModel;

  ServiceList? serviceList;
  List<srlist.Data>? svList =[];
  UpdateProfileModel ? updateProfileModel;

  //RegistrationResponseData? registrationResponseData;

  Future<bool>  postLogin(String email,password)async{
    var apiresponse = await _login_repo.userLogin(email,password);
    if(apiresponse.httpCode==200){
      userLogin=apiresponse.data;

      return true;
    }else return false;
  }

  Future<bool>  logOut()async{
    var apiresponse = await _login_repo.userLogout();
    print("api response is ........${apiresponse}");
    if(apiresponse){
      return true;
    }else return false;
  }


  Future<bool>  postService(data)async{
    var apiresponse = await _login_repo.postService(data);
    if(apiresponse.httpCode==200){
      serviceResponseModel = apiresponse.data;
      return true;
    }else return false;
  }



  getServiceList()async{
    var apiresponse = await _login_repo.getServiceList();
    if(apiresponse.httpCode==200){
      serviceList = apiresponse.data;
      svList = serviceList?.data;

    }
    notifyListeners();
  }


  Future<bool> uploadImage( File? image,id) async {


    if(image!=null && image!.path.isNotEmpty){
      FormData formData = FormData.fromMap({
        "image_url": await MultipartFile.fromFile(
          image!.path,
          filename: "image.jpg",
        ),
      });

      var apiresPonse = await _login_repo.uploadImage(formData,id);

      if(apiresPonse.httpCode==200){
        updateProfileModel = apiresPonse.data;
        return true;
      }else return false;

    }else {
      EasyLoading.dismiss();
      return false;}

  }

  updateProfile( data,id) async {
      var apiresPonse = await _login_repo.updateProfile(data,id);
      if(apiresPonse.httpCode==200){
        return true;
      }else return false;
  }
}