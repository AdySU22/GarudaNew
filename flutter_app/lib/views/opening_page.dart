// lib/opening_page.dart

import 'package:flutter/material.dart';

class OpeningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              'assets/city_image.png', // Ensure you have this image in your assets folder
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
