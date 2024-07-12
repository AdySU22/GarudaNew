import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../routes/app_routes.dart'; // Make sure you have the correct import path

class SignupController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> signup(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    _setLoading(true, context);
    final url = Uri.parse('http://210.247.245.155:8888/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': '${firstNameController.text} ${lastNameController.text}',
        'email': emailController.text,
        'telp': phoneController.text,
        'password': passwordController.text,
      }),
    );

    _setLoading(false, context);

    if (response.statusCode == 200) {
      // Handle successful signup
      final responseData = json.decode(response.body);
      final user = User.fromJson(responseData);

      // Save token to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.token);

      // Navigate to HomePage with User model
      Navigator.pushReplacementNamed(context, AppRoutes.homePage, arguments: user);
    } else {
      // Handle signup failure
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
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }
}
