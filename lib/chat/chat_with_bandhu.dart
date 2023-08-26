import 'package:bondu/utils/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
class ChatWithBandhu extends StatefulWidget {
  const ChatWithBandhu({Key? key}) : super(key: key);

  @override
  _ChatWithBandhuState createState() => _ChatWithBandhuState();
}

class _ChatWithBandhuState extends State<ChatWithBandhu> {

  TextEditingController controller = TextEditingController();

  final IO.Socket socket = IO.io('http://192.168.0.108:3000',IO.OptionBuilder().setTransports(['websocket']).setQuery({"username":"noor"}).build());

  _connectSocket(){
    socket.onConnect((data) => print("connection estublished...${data}"));
    socket.onConnectError((data) => print("Connect error : ${data}"));
    socket.onDisconnect((data) => print("Connect error : ${data}"));
  }

@override
  void initState() {
  _connectSocket();
    super.initState();
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
                          child: Text("Chat With Bandhu",style: TextStyle(color: AppColors.banOrange,fontSize: 16,fontWeight: FontWeight.w600),),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),

                    Expanded(
                      child: Container(

                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                          color:AppColors.banchatBackground.withOpacity(0.5)
                        ),
                      ),
                    ),



                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              right: 1,
              left: 1,
              child: Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,

                ),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type message",
                    hintStyle: TextStyle(color: AppColors.banblack.withOpacity(0.5),fontSize: 12,),
                    prefixIcon: Image.asset("assets/icons/ic-emuj.png"),
                    suffixIcon: IconButton(onPressed: () {

                      print("the text is ${controller.text}");
                      socket.emit('single_chat_message',{
                        'message':controller.text.trim(),
                        "sender":"noor"
                      });
                      setState(() {
                        controller.clear();
                      });

                    }, icon: Image.asset("assets/icons/ic-message-sent.png"),),

                    contentPadding: EdgeInsets.only(bottom: 1,top: 8)
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}