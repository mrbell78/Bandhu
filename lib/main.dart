import 'package:bondu/settings/settings.dart';
import 'package:bondu/signup/signup_email.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat/chat_controller.dart';
import 'chat/chat_with_bandhu.dart';
import 'custommer_care/CustommerSupport.dart';
import 'home/nav_root.dart';
import 'home/profile.dart';
import 'home/signin_welcome.dart';
import 'home/splash_screen.dart';
import 'login/login_email.dart';
import 'signup/signup_phone_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

