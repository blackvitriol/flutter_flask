import '../screens/home.dart';
import '../screens/splash.dart';
import '../screens/analysis.dart';
import '../screens/settings.dart';
import '../screens/second_page.dart';
import '../screens/login.dart';
import 'package:flutter/material.dart';

var routes = <String, WidgetBuilder>{
  '/': (context) => MyHomePage(),
  '/splash': (context) => Splash(),
  '/results': (context) => AnalysisPage(),
  '/settings': (context) => SettingsPage(),
  '/sec_page': (context) => SecondPage(),
  '/login': (context) => LoginPage(), 
};