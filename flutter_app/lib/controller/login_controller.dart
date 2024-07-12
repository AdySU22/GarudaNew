import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    _setLoading(true, context);
    final url = Uri.parse('http://210.247.245.155:8888/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    _setLoading(false, context);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData);

      // Extract token and user information
      final String token = responseData['token'];
      final User user = User(
        id: responseData['id'],
        name: responseData['name'],
        email: responseData['email'],
        telp: responseData['telp'],
        token: responseData["token"]
        // picture: responseData['picture'], // Assuming the picture field exists
      );

      // Save token to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      // Navigate to HomePage and pass the User model
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.homePage,
        arguments: user,
      );
    } else {
      final error = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error['message'])),
      );
    }
  }

  void _setLoading(bool value, BuildContext context) {
    _isLoading = value;
    (context as Element).markNeedsBuild(); // Force rebuild to update the UI
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
