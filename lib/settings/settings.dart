import 'package:bondu/utils/app-colors.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                          child: Text("Settings",style: TextStyle(color: AppColors.banOrange,fontSize: 16,fontWeight: FontWeight.w600),),
                        )
                      ],
                    ),

                    SizedBox(height: 15,),


                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width/2+90,
                        height: 35,
                        margin: EdgeInsets.only(left: 20,right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColors.banSettingsBackgrund1,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],

                        ),

                        child:Center(
                          child: Text("Notification",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),

                      ),
                        ),
                    ),),
                    SizedBox(height: 15,),

                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width/2+90,
                        height: 35,
                        margin: EdgeInsets.only(left: 20,right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColors.banSettingsBackgrund2,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],

                        ),

                        child:Center(
                          child: Text("Notification",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),

                          ),
                        ),
                      ),),
                    SizedBox(height: 15,),

                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width/2+90,
                        height: 35,
                        margin: EdgeInsets.only(left: 20,right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColors.banSettingsBackgrund3,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],

                        ),

                        child:Center(
                          child: Text("Notification",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.w400),

                          ),
                        ),
                      ),),
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