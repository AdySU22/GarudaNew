import 'package:flutter/material.dart';
import 'dart:async'; // for Timer
import 'package:shared_preferences/shared_preferences.dart'; // for SharedPreferences
import '../../core/app_export.dart';

class OpeningPage extends StatefulWidget {
  @override
  _OpeningPageState createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  void initState() {
    super.initState();
    _checkTokenAndNavigate();
  }

  Future<void> _checkTokenAndNavigate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');

    // Wait for 2 seconds before navigating
    await Future.delayed(Duration(seconds: 2));

    Navigator.of(context).pushReplacementNamed(AppRoutes.welcomingPage);
    // if (token != null) {
    //   // Navigate to the main screen (replace '/main' with your main screen route)
    //   Navigator.of(context).pushReplacementNamed(AppRoutes.homePage);
    // } else {
    //   // Navigate to the welcoming screen
    //   Navigator.of(context).pushReplacementNamed(AppRoutes.welcomingPage);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0XFFA7FF87),
              Color(0XFFFFFFFF)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Smart Reservations for a Smarter City',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Image.asset(
              ImageConstant.openingLogoPath, // Ensure you have this image in your assets folder
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
