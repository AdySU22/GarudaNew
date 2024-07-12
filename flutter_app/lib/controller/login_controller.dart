import 'dart:convert';
import 'package:flutter/material.dart';
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
    final url = Uri.parse('http://210.247.245.155:8000/login');
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
      // Handle successful login
      final responseData = json.decode(response.body);
      // Save token, navigate to another screen, etc.
    } else {
      // Handle login failure
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
