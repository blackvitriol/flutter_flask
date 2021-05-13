//    _____.__          __    __
//  _/ ____\  |  __ ___/  |__/  |_  ___________
//  \   __\|  | |  |  \   __\   __\/ __ \_  __ \
//  |  |  |  |_|  |  /|  |  |  | \  ___/|  | \/
//  |__|  |____/____/ |__|  |__|  \___  >__|
//  F L U T T E R    D E V E L O P M E N T
// A7 ALGORITHMS - 2020   |  Flutter Boilerplate
// Extra files for separating designs for modular and neater code

import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';

final cardStyle =  BoxDecoration(
                    color: Color(0xFFF3F9E4),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [BoxShadow(color: Colors.black12,
                    blurRadius: 2, offset: Offset(0,7),
                    spreadRadius: 1)]);

final textStyleUrdu = TextStyle(fontFamily: 'Cairo',
//                    shadows:[Shadow(blurRadius: 10.0, color: Colors.blueGrey, offset: Offset(5.0, 5.0),)]
);
final textStyleEnglish = TextStyle(fontFamily: 'Roboto',
//                    shadows:[Shadow(blurRadius: 10.0, color: Colors.blueGrey, offset: Offset(5.0, 5.0),)]
);

final splashTextStyle = TextStyle(color: Colors.black, 
                                         fontSize: 120, 
                                         fontStyle: FontStyle.normal,
                                         fontWeight: FontWeight.bold);

final headings2_shadow = Shadow(
        offset: Offset(10.0, 10.0),
        blurRadius: 10.0,
        color: Color.fromARGB(255, 0, 0, 0),
      );

final heading2 = TextStyle(fontFamily: 'Roboto', color: Colors.black, 
                           fontSize: 100, shadows: [headings2_shadow]);

final heading3 = TextStyle(fontFamily: 'Roboto', color: Colors.black, 
                           fontSize: 30);

final heading4 = TextStyle(fontFamily: 'Roboto', color: Colors.black, 
                           fontSize: 15);        

final heading5 = TextStyle(fontFamily: 'Roboto', color: Colors.yellow, 
                           fontSize: 15);                 

MaterialButton customButton2(String text, Function onTap){
    return MaterialButton(
      onPressed: onTap(),
      child: Text(text),
      color: Colors.cyan,
      height: 10,
      minWidth: 10,
    );
} 

// Allows dynamic resizing based on screensize
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth -
        _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight -
        _safeAreaVertical) / 100;
  }
}
