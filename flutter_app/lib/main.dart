// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_app/core/app_export.dart';

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
        fontFamily: 'Inter', // Set default font family
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
          labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          // Customize more text styles as needed
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
