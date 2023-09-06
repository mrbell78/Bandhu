import 'package:bondu/main_service/shr_service.dart';
import 'package:bondu/utils/app-colors.dart';
import 'package:bondu/utils/nav_utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'gender_base_vaiolance.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/icons/water_mark.png")),
              right: -110,
              top: -10,

            ),

            Positioned(
              child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/icons/water_mark.png")),
              left: -110,
              top: -10,

            ),

            Positioned(
              child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/icons/water_mark.png")),
              right: -110,
              top: MediaQuery.of(context).size.height/2-100,

            ),

            Positioned(
              child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/icons/water_mark.png")),
              left: -110,
              top: MediaQuery.of(context).size.height/2-100,

            ),
            Positioned(
              child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/icons/water_mark.png")),
              left: -110,
              top: MediaQuery.of(context).size.height/2+100,

            ),
            Positioned(
              child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/icons/water_mark.png")),
              right: -110,
              top: MediaQuery.of(context).size.height/2+100,

            ),
            Positioned.fill(
              top: 110,
              child: Align(

                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    SizedBox(height: 20,),
                    Center(child: Image.asset("assets/icons/welcome_logo.png",height: 110,)),
                    SizedBox(height: 20,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("We Provide",style: TextStyle(color: AppColors.banOrange,fontSize: 16,fontWeight: FontWeight.w600),),
                        )
                      ],
                    ),

                    SizedBox(height: 15,),


                    GestureDetector(
                      onTap: (){
                        launch("http://web-bondhu.ekopii.com/about-bandhu");
                      },
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width/2+90,
                          height: 50,
                          margin: EdgeInsets.only(left: 20,right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: AppColors.banaAboutColor,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.3),
                            //     spreadRadius: 2,
                            //     blurRadius: 2,
                            //     offset: Offset(0, 3), // changes position of shadow
                            //   ),
                            // ],

                          ),

                          child:Row(
                            children: [
                              Container(
                                width: 66,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                  color: AppColors.pureWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],

                                ),
                                child: Center(child: Container(margin:EdgeInsets.only(top: 5),child: Image.asset("assets/icons/ic-logo-small.png"))),
                              ),
                              Spacer(),
                              Text("About Bandhu",style: TextStyle(color: AppColors.pureBlack,fontSize: 14,fontWeight: FontWeight.w600),),
                              SizedBox(width: 20,),
                              Spacer(),
                            ],
                          ),
                        ),),
                    ),
                    SizedBox(height: 15,),

                    GestureDetector(
                      onTap: (){

                      },
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width/2+90,
                          height: 50,
                          margin: EdgeInsets.only(left: 20,right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: AppColors.banLightYellow,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.3),
                            //     spreadRadius: 2,
                            //     blurRadius: 2,
                            //     offset: Offset(0, 3), // changes position of shadow
                            //   ),
                            // ],

                          ),

                          child:Row(
                            children: [
                              Container(
                                width: 66,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                  color: AppColors.pureWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],

                                ),
                                child: Center(child: Container(margin:EdgeInsets.only(top: 5),child: Image.asset("assets/icons/ic-justice.png"))),
                              ),
                              Spacer(),
                              Text("NCD",style: TextStyle(color: AppColors.pureBlack,fontSize: 14,fontWeight: FontWeight.w600),),
                              SizedBox(width: 20,),
                              Spacer(),
                            ],
                          ),
                        ),),
                    ),
                    SizedBox(height: 15,),


                    GestureDetector(
                      onTap: (){
                        NavUtils.push(context, SHRService());
                      },
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width/2+90,
                          height: 50,
                          margin: EdgeInsets.only(left: 20,right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: AppColors.banSettingsBackgrund2,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.3),
                            //     spreadRadius: 2,
                            //     blurRadius: 2,
                            //     offset: Offset(0, 3), // changes position of shadow
                            //   ),
                            // ],

                          ),

                          child:Row(
                            children: [
                              Container(
                                width: 66,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                  color: AppColors.pureWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],

                                ),
                                child: Center(child: Container(margin:EdgeInsets.only(top: 5),child: Image.asset("assets/icons/ic-caculator.png"))),
                              ),
                              Spacer(),
                              Text("SRHR",style: TextStyle(color: AppColors.pureBlack,fontSize: 14,fontWeight: FontWeight.w600),),
                              SizedBox(width: 20,),
                              Spacer(),
                            ],
                          ),
                        ),),
                    ),
                    SizedBox(height: 15,),


                    GestureDetector(
                      onTap: (){

                      },
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width/2+90,
                          height: 50,
                          margin: EdgeInsets.only(left: 20,right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: AppColors.banSettingsBackgrund1,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.3),
                            //     spreadRadius: 2,
                            //     blurRadius: 2,
                            //     offset: Offset(0, 3), // changes position of shadow
                            //   ),
                            // ],

                          ),

                          child:Row(
                            children: [
                              Container(
                                width: 66,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                  color: AppColors.pureWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],

                                ),
                                child: Center(child: Container(margin:EdgeInsets.only(top: 5),child: Image.asset("assets/icons/ic-website.png"))),
                              ),
                              Spacer(),
                              Text("Mental Health",style: TextStyle(color: AppColors.pureBlack,fontSize: 14,fontWeight: FontWeight.w600),),
                              SizedBox(width: 20,),
                              Spacer(),
                            ],
                          ),
                        ),),
                    ),
                    SizedBox(height: 15,),


                    GestureDetector(
                      onTap: (){
                        NavUtils.push(context, GenderBaseVaiolance());
                      },
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width/2+90,
                          height: 50,
                          margin: EdgeInsets.only(left: 20,right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: AppColors.banLightCyne,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.3),
                            //     spreadRadius: 2,
                            //     blurRadius: 2,
                            //     offset: Offset(0, 3), // changes position of shadow
                            //   ),
                            // ],

                          ),

                          child:Row(
                            children: [
                              Container(
                                width: 66,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                  color: AppColors.pureWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],

                                ),
                                child: Center(child: Container(margin:EdgeInsets.only(top: 5),child: Image.asset("assets/icons/ic-gender-des.png"))),
                              ),
                              Spacer(),
                              Text("Gender Base Violence",style: TextStyle(color: AppColors.pureBlack,fontSize: 14,fontWeight: FontWeight.w600),),
                              SizedBox(width: 20,),
                              Spacer(),
                            ],
                          ),
                        ),),
                    ),
                    SizedBox(height: 15,),



                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}