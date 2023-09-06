import 'package:flutter/material.dart';

import '../locator/locator.dart';
import 'login_repository.dart';
import 'model/signinup_response.dart';

class CustommerLoginController extends ChangeNotifier{

  var _login_repo = locator<LoginRepository>();

  CustommerLogin ?custommerLogin;

  //RegistrationResponseData? registrationResponseData;

  Future<bool>  postLogin(String userName,String phone,String email)async{
    var apiresponse = await _login_repo.userLogin(userName,phone,email);
    if(apiresponse.httpCode==200){
      custommerLogin=apiresponse.data;

      return true;
    }else return false;
  }

  Future<bool>  logOut(String token)async{
    var apiresponse = await _login_repo.userLogout(token);
    print("api response is ........${apiresponse}");
    if(apiresponse){
      return true;
    }else return false;
  }

  // Future<bool>  postRegistration(data)async{
  //   var apiresponse = await _login_repo.postRegistration(data);
  //   if(apiresponse.httpCode==200){
  //     // registrationResponseData=apiresponse.data;
  //     return true;
  //   }else return false;
  // }
  //
  // Future<bool> getUserData()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String loginData = (prefs.getString('logininfo') ?? "") ;
  //
  //   if(loginData!=null && loginData.isNotEmpty){
  //
  //     print("the data is ${loginData}");
  //
  //     Map<String,dynamic> mapdata= jsonDecode(loginData);
  //     custommerLogin  =CustommerLogin.fromJson(mapdata);
  //     notifyListeners();
  //     return true;
  //
  //   }else return false;
  //
  // }

}