// lib/main.dart

import 'package:flutter/material.dart';
import 'views/opening_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Reservations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OpeningPage(),
    );
  }
}
