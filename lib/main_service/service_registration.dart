import 'package:bondu/main_service/request_model/service_requestbody.dart';
import 'package:bondu/main_service/shr_service.dart';
import 'package:bondu/main_service/upload_image.dart';
import 'package:bondu/signup/login_controller.dart';
import 'package:bondu/utils/app-colors.dart';
import 'package:bondu/utils/nav_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'gender_base_vaiolance.dart';

class Services_Registration extends StatefulWidget {
  final serviceName;
  final serviceId;

  const Services_Registration({Key? key, this.serviceName,this.serviceId}) : super(key: key);

  @override
  _Services_RegistrationState createState() => _Services_RegistrationState();
}

class _Services_RegistrationState extends State<Services_Registration> {
  bool isSelected = false;

  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xffffffff);

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    isSelected = true;
    setState(() => pickerColor = color);
  }

  TextEditingController tittleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CustommerLoginController>(
      builder: (_,provider,__){
        return  Scaffold(
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
                  top: MediaQuery.of(context).size.height / 2 - 100,
                ),
                Positioned(
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset("assets/icons/water_mark.png")),
                  left: -110,
                  top: MediaQuery.of(context).size.height / 2 - 100,
                ),
                Positioned(
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset("assets/icons/water_mark.png")),
                  left: -110,
                  top: MediaQuery.of(context).size.height / 2 + 100,
                ),
                Positioned(
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset("assets/icons/water_mark.png")),
                  right: -110,
                  top: MediaQuery.of(context).size.height / 2 + 100,
                ),
                Positioned.fill(
                  top: 110,
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Image.asset(
                              "assets/icons/welcome_logo.png",
                              height: 110,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "Edit ${widget.serviceName}",
                                style: TextStyle(
                                    color: AppColors.banOrange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 35,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: AppColors.banchatBackground.withOpacity(0.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset:
                                    Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Change Tittle",
                                  style: TextStyle(
                                      color: AppColors.banblack,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2 + 150,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                border:
                                Border.all(color: AppColors.grayA0, width: 1),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset:
                                    Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                controller: tittleController,
                                style: TextStyle(
                                    color: AppColors.banblack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),

                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        color: AppColors.banblack,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                    hintText: 'Type here',
                                    // suffixIcon: Image.asset("assets/icons/password.png"),
                                    contentPadding:
                                    EdgeInsets.only(bottom: 12, left: 10)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Container(
                        //       width: MediaQuery.of(context).size.width / 2,
                        //       height: 35,
                        //       margin: EdgeInsets.only(left: 20, right: 20),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.all(Radius.circular(15)),
                        //         color: AppColors.banSettingsBackgrund1
                        //             .withOpacity(0.5),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.grey.withOpacity(0.3),
                        //             spreadRadius: 2,
                        //             blurRadius: 2,
                        //             offset:
                        //             Offset(0, 3), // changes position of shadow
                        //           ),
                        //         ],
                        //       ),
                        //       child: Center(
                        //         child: Text(
                        //           "Add Files",
                        //           style: TextStyle(
                        //               color: AppColors.banblack,
                        //               fontSize: 14,
                        //               fontWeight: FontWeight.w400),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 8,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Container(
                        //       width: MediaQuery.of(context).size.width / 2 + 150,
                        //       height: 40,
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.all(Radius.circular(15)),
                        //         border:
                        //         Border.all(color: AppColors.grayA0, width: 1),
                        //         color: Colors.white,
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.grey.withOpacity(0.5),
                        //             spreadRadius: 2,
                        //             blurRadius: 2,
                        //             offset:
                        //             Offset(0, 3), // changes position of shadow
                        //           ),
                        //         ],
                        //       ),
                        //       child: Center(
                        //         child: GestureDetector(
                        //           onTap: () {
                        //             showDialog(
                        //               context: context,
                        //               builder: (BuildContext context) {
                        //                 return const ContentImageUpload();
                        //               },
                        //             );
                        //           },
                        //           child: Text(
                        //             "Select files",
                        //             style: TextStyle(
                        //                 color: AppColors.banblack,
                        //                 fontSize: 14,
                        //                 fontWeight: FontWeight.w400),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 35,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: AppColors.banLightYellow.withOpacity(0.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset:
                                    Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Add Description",
                                  style: TextStyle(
                                      color: AppColors.banblack,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2 + 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                border:
                                Border.all(color: AppColors.grayA0, width: 1),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset:
                                    Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                controller: descriptionController,

                                style: TextStyle(
                                    color: AppColors.banblack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        color: AppColors.banblack,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                    hintText: 'Type here',
                                    // suffixIcon: Image.asset("assets/icons/password.png"),
                                    contentPadding:
                                    EdgeInsets.only(bottom: 9, left: 10)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 35,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                color: AppColors.banaProfileColor.withOpacity(0.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset:
                                    Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Select Background",
                                  style: TextStyle(
                                      color: AppColors.banblack,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2 + 150,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                border:
                                Border.all(color: AppColors.grayA0, width: 1),
                                color: currentColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset:
                                    Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Pick a color!'),
                                          content: SingleChildScrollView(
                                            child: ColorPicker(
                                              pickerColor: pickerColor,
                                              onColorChanged: changeColor,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              child: const Text('Got it'),
                                              onPressed: () {
                                                setState(() =>
                                                currentColor = pickerColor);
                                                Fluttertoast.showToast(
                                                    msg: "Color Selected",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "Select Background",
                                    style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : AppColors.banblack,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: TextButton(
                              style: ButtonStyle(
                                alignment: Alignment.center,
                                backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed)) {
                                      return Theme.of(context).colorScheme.primary;
                                    }
                                    return null; // Use the component's default.
                                  },
                                ),
                              ),
                              onPressed: () async{
                                var data = ServiceRequestBody(
                                  title: tittleController.text,
                                  description: descriptionController.text,
                                  servicelistId: widget.serviceId.toString(),
                                  mediaUrl: "",
                                  colorCode: "${currentColor}"
                                );
                                EasyLoading.show(status: "Uploading..");
                                await provider.postService(data).then((value) {
                                  EasyLoading.dismiss();
                                  Fluttertoast.showToast(
                                      msg: "Your service is posted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                  Navigator.pop(context);
                                });
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Post Service",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.upload,
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 120,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

      },

    );
  }
}
