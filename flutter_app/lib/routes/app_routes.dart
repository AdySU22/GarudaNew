import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/views/confirmation_page.dart';
import 'package:flutter_app/views/home_page.dart';
import 'package:flutter_app/views/login_page.dart';
import 'package:flutter_app/views/opening_page.dart';
import 'package:flutter_app/views/payment_status.dart';
import 'package:flutter_app/views/profile_page.dart';
import 'package:flutter_app/views/property_register_page.dart';
import 'package:flutter_app/views/purchase_history_page.dart';
import 'package:flutter_app/views/purchase_page.dart';
import 'package:flutter_app/views/search_page.dart';
import 'package:flutter_app/views/setting_page.dart';
import 'package:flutter_app/views/signup_page.dart';
import 'package:flutter_app/views/venue_finder_page.dart';
import 'package:flutter_app/views/welcoming_page.dart';

class AppRoutes {
  // Define all route names as constants for easy reference
  static const String initialRoute = '/initialRoute';
  static const String openingPage = '/opening_page';
  static const String welcomingPage = '/welcoming_page';
  static const String signupPage = '/signup_page';
  static const String loginPage = '/login_page';
  static const String homePage = '/home_page';
  static const String venueFinderPage = '/venue_finder_page';
  static const String searchPage = '/search_page';
  static const String confirmationPage = '/confirmation_page';
  static const String purchasePage = '/purchase_page';
  static const String paymentStatusPage = '/payment_status_page';
  static const String purchaseHistoryPage = '/purchase_history_page';
  static const String settingPage = '/setting_page';
  static const String profilePage = '/profile_page';
  static const String propertyRegisterPage = '/property_register_page';

  // Map routes to their corresponding widgets using WidgetBuilder
  static Map<String, WidgetBuilder> routes = {
    initialRoute: (context) => OpeningPage(),
    openingPage: (context) => OpeningPage(),
    welcomingPage: (context) => WelcomingPage(),
    signupPage: (context) => SignupPage(),
    loginPage: (context) => LoginPage(),
    venueFinderPage: (context) => VenueFinderPage(),
    searchPage: (context) => SearchPage(),
    confirmationPage: (context) => ConfirmationPage(),
    purchasePage: (context) => PurchasePage(),
    paymentStatusPage: (context) => PaymentStatusPage(),
    purchaseHistoryPage: (context) => PurchaseHistoryPage(),
    settingPage: (context) => SettingPage(),
    profilePage: (context) => ProfilePage(),
    propertyRegisterPage: (context) => PropertyRegisterPage(),
  };

  // Route generator function for named routes that require arguments
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        final user = settings.arguments as User;
        return MaterialPageRoute(builder: (_) => HomePage(user: user));
      // Add cases for other routes that need arguments similarly
      default:
        return MaterialPageRoute(builder: (_) => OpeningPage());
    }
  }
}
