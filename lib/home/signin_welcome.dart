import 'package:bondu/signup/model/signinup_response.dart';
import 'package:bondu/utils/app-colors.dart';
import 'package:bondu/utils/nav_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login/login_email.dart';
import '../signup/login_controller.dart';
import 'nav_root.dart';

class SigninWelcome extends StatefulWidget {
  const SigninWelcome({Key? key}) : super(key: key);

  @override
  _SigninWelcomeState createState() => _SigninWelcomeState();
}

class _SigninWelcomeState extends State<SigninWelcome> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<CustommerLoginController>(
      builder: (_,provider,__){
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Row(
                children: [
                  Container(
                    width: 150,
                    height: 70,

                    child: Stack(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      children: [
                        Positioned(

                          child: Image.asset("assets/icons/water_mark.png"),
                          left: 0,
                          bottom: 0,
                          top: -10,

                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 150,
                    height:70,

                    child: Stack(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      children: [
                        Positioned(

                          child: Image.asset("assets/icons/water_mark.png"),
                          right: 0,
                          bottom: 0,
                          top: -10,

                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Center(child: Image.asset("assets/icons/welcome_logo.png",height: 110,)),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/ic-male.png"),
                  SizedBox(width: 8,),
                  Image.asset("assets/icons/ic-female.png"),
                  SizedBox(width: 8,),
                  Image.asset("assets/icons/ic-commongender.png"),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome To Bandhu",style: TextStyle(color: AppColors.banOrange,fontSize: 28,fontWeight: FontWeight.w600),),

                ],
              ),

              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login for admin",style: TextStyle(color: AppColors.banOrange,fontSize: 14,fontWeight: FontWeight.w500),),

                ],
              ),

              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2+150,
                    height: 35,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: AppColors.bandarkGrey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],

                    ),

                    child:  TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: emailController,
                      style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                          hintText: 'Email',
                          contentPadding: EdgeInsets.only(bottom: 12,left: 10)
                      ),
                    ),

                  ),
                ],
              ),

              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2+150,
                    height: 35,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: AppColors.bandarkGrey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),

                    child:  TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: numberController,
                      style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                      obscureText: true,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                          hintText: 'password',

                          // suffixIcon: Image.asset("assets/icons/password.png"),
                          contentPadding: EdgeInsets.only(bottom: 9,left: 10)
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30,),

              Container(
                width: MediaQuery.of(context).size.width/2+150,
                margin: EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap:(){
                          // addStringToSF(nameController.text.trim());


                          provider.postLogin(emailController.text.trim(),numberController.text.trim(),).then((value) {

                            NavUtils.push(context, NavigationRoot());

                          });
                        },
                        child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: AppColors.banDarkOrange,),
                            child:Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),))

                        ),
                      ),
                    ),

                  ],
                ),
              ),



              Spacer(),
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 70,

                    child: Stack(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      children: [
                        Positioned(

                          child: Image.asset("assets/icons/water_mark.png"),
                          left: 0,
                          bottom: -10,
                          top: 0,

                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 150,
                    height: 70,

                    child: Stack(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      children: [
                        Positioned(

                          child: Image.asset("assets/icons/water_mark.png"),
                          right: 0,
                          bottom: -10,
                          top: 0,

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }

    );
  }
}
