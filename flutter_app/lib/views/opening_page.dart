// lib/opening_page.dart

import 'package:flutter/material.dart';

class OpeningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0XFFA7FF87),
            Color(0XFFFFFFFF)
          ])),
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
              'assets/images/opening_logo.png', // Ensure you have this image in your assets folder
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
