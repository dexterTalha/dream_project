import 'dart:async';

import 'package:dreame_project/helpers/shared_pref.dart';
import 'package:dreame_project/screens/login_screen.dart';
import 'package:dreame_project/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() { 
    super.initState();
    final pref = SharedPref();
    pref.getOld().then((val){
        handleTimeOut(val);
    });
    
  }

  handleTimeOut(isOld){
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (context, anim1, anim2) => isOld ? LoginScreen() : WelcomeScreen()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xffF16739)
        ),
        child: Center(

          child: Text(
            "DREAM PROJECT",
            style: TextStyle(
              fontFamily: "Maven",
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(4.0, 4.0),
                    blurRadius: 6.0,
                    color: Color.fromARGB(60, 100, 100, 100),
                  ),
                  
                ],
              )
          )
        ),
      ),
    );
  }
}
