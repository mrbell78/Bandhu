import 'package:bondu/utils/app-colors.dart';
import 'package:bondu/utils/nav_utils.dart';
import 'package:flutter/material.dart';

import '../chat/chat_with_bandhu.dart';
import '../custommer_care/CustommerSupport.dart';

class GenderBaseVaiolance extends StatefulWidget {
  //const GenderBaseVaiolance({Key? key}) : super(key: key);

  @override
  _GenderBaseVaiolanceState createState() => _GenderBaseVaiolanceState();
}

class _GenderBaseVaiolanceState extends State<GenderBaseVaiolance> {


  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget remindButton = TextButton(
      child: Text("sms"),
      onPressed:  () {
        NavUtils.push(context, ChatWithBandhu());
      },
    );
    Widget call = TextButton(
      child: Text("Call",style: TextStyle(),),
      onPressed:  () async{
        NavUtils.push(context, CustommerSupport());

      },
    );

    Widget cancelButton = TextButton(
      child: Text("Cancel",style: TextStyle(color: Colors.red),),
      onPressed:  () async{

        Navigator.pop(context);

      },
    );


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(

      title: Text("Service Provider"),
      content: Text("If you want to know more, Please keep in touch through message or call"),
      actions: [
        cancelButton,
        remindButton,
        call
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
                          child: Text("Gender Base Violence",style: TextStyle(color: AppColors.pureBlack,fontSize: 16,fontWeight: FontWeight.w600),),
                        )
                      ],
                    ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      children: [
                        GestureDetector(
                            onTap:(){
                              showAlertDialog(context);
                            },
                            child: Container(
                                margin: EdgeInsets.only(left: 10,right: 10),
                                child: Image.asset("assets/images/ic-w-img1.png",fit: BoxFit.cover,))),
                        GestureDetector(
                            onTap:(){
                              showAlertDialog(context);
                            },
                            child: Container(
                                margin: EdgeInsets.only(left: 10,right: 10),
                                child: Image.asset("assets/images/ic-w-img2.png",fit: BoxFit.cover,))),
                        GestureDetector(
                            onTap:(){
                              showAlertDialog(context);
                            },
                            child: Container(
                                margin: EdgeInsets.only(left: 10,right: 10),
                                child: Image.asset("assets/images/ic-w-img3.png",fit: BoxFit.cover,))),
                        GestureDetector(
                            onTap:(){
                              showAlertDialog(context);
                            },
                            child: Container(
                                margin: EdgeInsets.only(left: 10,right: 10),
                                child: Image.asset("assets/images/ic-w-img4.png",fit: BoxFit.cover,))),
                        SizedBox(height: 50,)
                      ],
                    ),
                  ),
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