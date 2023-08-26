import 'package:bondu/home/signin_welcome.dart';
import 'package:bondu/utils/app-colors.dart';
import 'package:bondu/utils/nav_utils.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show lerpDouble;

class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late AnimationController _controller;
  late AnimationController _fadeOut ;
  late Animation<double> _animation;
  late Animation<double> _animationLogo;

  bool _isVisible = true;

  double _startRadius = 20.0;
  double _endRadius = 100.0;
  double _currentRadius = 20.0;
  double _progress = 0.0;
  
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,

      duration: Duration(milliseconds:1500), // Adjust the duration as needed
    );
    _fadeOut = AnimationController(
      vsync: this,

      duration: Duration(milliseconds:2000), // Adjust the duration as needed
    );



    _animation = Tween<double>(begin:0.0, end: 23).animate(_controller)
      ..addListener(() {



      });

    Future.delayed(Duration(seconds: 1), () {
      _controller.forward();

      _controller.addStatusListener((status) {
        NavUtils.pushReplacement(context, SigninWelcome());
      });

    });

    Future.delayed(Duration(seconds: 1), () {
      _fadeOut.forward();
    });




    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _fadeOut.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Center(
            child: ScaleTransition(
              scale: _animation,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: AppColors.banSplashBackground
                ),

              ),
            ),
          ),

          Center(child: FadeTransition(

              opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                CurvedAnimation(
                  parent: _fadeOut,
                  curve: Curves.easeInOut,
                ),
              ),
              child: Image.asset("assets/icons/logo.png")))

        ],
      ),

      // body: AnimatedBuilder(
      //
      //   animation: _controller,
      //   child:  Container(height: 1500,width: 1500,color: Colors.red,),
      //   builder: (BuildContext context, Widget? child) {
      //     return Center(
      //       child: Container(
      //         width: lerpDouble(1000,_currentRadius, _controller.value),
      //         height: lerpDouble(1000, _currentRadius, _controller.value),
      //         child: ClipRRect(
      //           borderRadius: new BorderRadius.circular(
      //             (_currentRadius/2) * _controller.value,
      //           ),
      //           child: child,
      //         ),
      //       ),
      //     );
      //
      //   },),


    );
    // return  Center(
    //   child: Container(
    //     width: circleSize,
    //     height: MediaQuery.of(context).size.height,
    //     decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       color: AppColors.banSplashBackground
    //     ),
    //   ),
    // );
  }
}
