import 'dart:convert';

import 'package:bondu/chat/chat_controller.dart';
import 'package:bondu/chat/chat_with_bandhu.dart';
import 'package:bondu/utils/app-colors.dart';
import 'package:bondu/utils/nav_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../signup/model/user_login_model.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  void initState() {
    // TODO: implement initState

    getUserData().then((value) {
      Provider.of<ChatController>(context,listen: false).getuserList(custommerLogin?.data?.user?.id);
    });
    super.initState();
  }

  UserLoginModel? custommerLogin;
  Future<bool> getUserData()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loginData = (prefs.getString('logininfo') ?? "") ;

    if(loginData!=null && loginData.isNotEmpty){

      print("the data is ${loginData}");

      Map<String,dynamic> mapdata= jsonDecode(loginData);
      custommerLogin  =UserLoginModel.fromJson(mapdata);
      return true;

    }else return false;

  }
  @override
  Widget build(BuildContext context) {
    return  Consumer<ChatController>(
      builder: (BuildContext context, provider, __) {
        return Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 20,),
                  Image.asset("assets/icons/welcome_logo.png",height: 48,width: 100,),
                  SizedBox(width: 30,),
                  Image.asset("assets/icons/water_mark.png",width: 150,height: 100,),
                  SizedBox(width: 10,)
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Message User List",style: TextStyle(color: AppColors.banOrange,fontSize: 20,fontWeight: FontWeight.w500),)
                ],
              ),
              SizedBox(height: 20,),
              provider.inboxList!.length>0? Expanded(
                child: Container(

                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: provider.inboxList!.length>0?provider.inboxList!.length:0,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            NavUtils.push(context, ChatWithBandhu(id: provider.inboxList?[index].id,fromUserDetals: provider.inboxList![index],));
                          },
                          child: Container(
                            child:  Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height:40,
                                      width: 40,
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                          color: AppColors.banOrange,
                                          borderRadius: BorderRadius.all(Radius.circular(100))
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(1),
                                        child: CircleAvatar(
                                          backgroundImage:AssetImage("assets/icons/ic-male.png"),
                                          backgroundColor: Colors.white,
                                          radius: 38,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${provider.inboxList![index].userId}",style: TextStyle(color: AppColors.banblack,fontSize: 14,fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5,),
                                        Container(
                                            width: MediaQuery.of(context).size.width/2 +100,
                                            child: Text("${provider.inboxList![index].userId}",style: TextStyle(color: AppColors.banblack,fontSize: 10,fontWeight: FontWeight.w500),)),
                                      ],)

                                  ],),
                                SizedBox(height: 10,),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ):Center(child: Text("No user available currently",style: TextStyle(color: Colors.grey,fontSize: 18),)),
              SizedBox(height: 20,),
            ],
          ),
        );
      },

    );
  }
}
