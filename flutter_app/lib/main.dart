// lib/main.dart

import 'package:flutter/material.dart'; // Importing Flutter's material design components.
import 'package:flutter_app/core/app_export.dart'; // Importing custom application routes.

void main() {
  runApp(MyApp()); // Starting the Flutter application with MyApp widget.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Reservations', // Setting the application title.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Setting the primary color scheme.
      ),
      debugShowCheckedModeBanner: false, // Disabling debug banner in release mode.
      initialRoute: AppRoutes.initialRoute, // Setting the initial route of the application.
      routes: AppRoutes.routes, // Defining named routes for navigation.
      onGenerateRoute: AppRoutes.onGenerateRoute, // Generating routes dynamically.
    );
  }
}
