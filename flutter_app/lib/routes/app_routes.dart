import 'package:flutter/material.dart';
import 'package:flutter_app/views/login_page.dart';
import 'package:flutter_app/views/opening_page.dart';
import 'package:flutter_app/views/signup_page.dart';
import 'package:flutter_app/views/welcoming_page.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String openingPage = '/opening_page';
  static const String welcomingPage = '/welcoming_page';
  static const String signupPage = '/signup_page';
  static const String loginPage = '/login_page';

  static Map<String, WidgetBuilder> routes = {
    initialRoute :(context) => OpeningPage(),
    openingPage : (context)=> OpeningPage(),
    welcomingPage : (context)=> WelcomingPage(),
    signupPage : (context)=> SignupPage(),
    loginPage : (context)=> LoginPage(),
  };
}