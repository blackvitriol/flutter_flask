//    _____.__          __    __
//  _/ ____\  |  __ ___/  |__/  |_  ___________
//  \   __\|  | |  |  \   __\   __\/ __ \_  __ \
//  |  |  |  |_|  |  /|  |  |  | \  ___/|  | \/
//  |__|  |____/____/ |__|  |__|  \___  >__|
//  F L U T T E R    D E V E L O P M E N T
// A7 ALGORITHMS - 2020   |  Flutter Boilerplate
// 2. This is the splash screen code that just checks
//    if the app has been opened before and loads user prefs

// Importing libraries
import 'dart:async';
import '../app.dart';
import '../utilities/styles.dart';
import '../utilities/animations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';


//=== MAIN WIDGET ==============================================================
// Create Splash Screen object (stateful widget)
class Splash extends StatefulWidget {
  @override
  SplashState createState() =>  SplashState();
}
//=== END:  MAIN WIDGET =========================================================

//=== MAIN WIDGET STATE =========================================================
// Manage Splash Screen object state
class SplashState extends State<Splash> {

// START : 2.2 State properties: Server ############################################
// User Journey: Check if user is new or returning
// Check user configurations
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('firsttime?') ?? false);

// PATH 1: Check user configurations : Returning User
    if (_seen) {
      print("Welcome back");
      // Navigator.of(context).pushReplacement(
          // MaterialPageRoute(builder: (context) => HomeScreen())); //UserAuth
// PATH 2: Check user configurations : New User5
      } else {
      print("Welcome to app for the first time !");
      await prefs.setBool('firsttime?', true);
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => Onboarding()));
    }
  }

// Splash Screen timeout
  @override
  void initState() {
    super.initState();
    Timer( Duration(milliseconds: 3000), () {
      checkFirstSeen();
      Navigator.pushReplacementNamed(context, '/');
    });
  }
// ## END : State properties: Server ###########################################

// ## START: State properties: Interface Widgets ###############################
// ############### USER INTERFACE #############################################
// State properties: UI
  @override Widget build(BuildContext context) {
    SizeConfig().init(context);
//  -------------------------- BACKGROUND -------------------------------------
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    // ## START: State properties: User Interface ##############################
     home: Scaffold(
            backgroundColor: Color(0xFFE1E1E1),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//  -------------------------- CARD -------------------------------------------
            children: <Widget>[
              FadeInAnimation(1, Container(
//                margin: const EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.90,
                width: MediaQuery.of(context).size.width * 0.90,
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                        color: Color(0xFFF3F9E4),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [BoxShadow(color: Colors.black12,
                                              blurRadius: 2, offset: Offset(0,7),
                                              spreadRadius: 1)]),
//  -------------------------- CARD CONTENTS -----------------------------------
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          FadeInAnimation(1, Container(height: SizeConfig.screenHeight*0.5,
                            child: Image.asset('resources/images/app_icon.png'))),
                          FadeInAnimation(2, FittedBox(fit: BoxFit.fitWidth,
                            child: Text("A7 DPE", style: splashTextStyle, textAlign: TextAlign.center),
                          )),
                          FadeInAnimation(3, FittedBox(fit: BoxFit.fitWidth,
                            child: Text("Welcome to the Data Processing Engine app !"))
                          )]
                                    )
                                      ),
              )
              )],
          )
      )// Layout
    )
    )
    ;// Background
  }

}
//=== END:  MAIN WIDGET STATE ===================================================