import 'dart:convert'; // Importing Dart's convert library for JSON encoding/decoding.
import 'package:flutter/material.dart'; // Importing Flutter's material design components.
import 'package:flutter_app/core/app_export.dart';
import 'package:flutter_app/models/user.dart'; // Importing the User model.
import 'package:flutter_app/routes/app_routes.dart'; // Importing application routes.
import 'package:shared_preferences/shared_preferences.dart'; // Importing shared preferences for local storage.
import 'package:http/http.dart' as http; // Importing HTTP client for making API requests.

class LoginController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Form key for form validation.
  final TextEditingController emailController = TextEditingController(); // Controller for email input.
  final TextEditingController passwordController = TextEditingController(); // Controller for password input.

  bool _isLoading = false; // State variable to track loading state.

  bool get isLoading => _isLoading; // Getter to access loading state.

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return; // Validate form input.

    _setLoading(true, context); // Set loading state to true.

    final url = Uri.parse(APIConstant.loginRoute); // API endpoint for login.
    final response = await http.post( // Making a POST request to the login endpoint.
      url,
      headers: {'Content-Type': 'application/json'}, // Setting headers for JSON content.
      body: json.encode({ // Encoding user credentials as JSON.
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    _setLoading(false, context); // Set loading state to false after API call.

    if (response.statusCode == 200) { // Checking if the API call was successful.
      final responseData = json.decode(response.body); // Decoding response JSON.

      // Extracting user information from response data.
      final String token = responseData['token']; // Extracting authentication token.
      final User user = User( // Creating a User model object.
        id: responseData['id'],
        name: responseData['name'],
        email: responseData['email'],
        telp: responseData['telp'],
        token: responseData['token'],
        // picture: responseData['picture'], // Assuming the picture field exists.
      );

      // Saving authentication token to SharedPreferences for persistent storage.
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      // Navigating to the home page and passing the User model as arguments.
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.homePage,
        arguments: user,
      );
    } else { // Handling errors if the API call fails.
      final error = json.decode(response.body); // Decoding error message from JSON.
      ScaffoldMessenger.of(context).showSnackBar( // Displaying error message as a snack bar.
        SnackBar(content: Text(error['detail'])),
      );
    }
  }

  void _setLoading(bool value, BuildContext context) {
    _isLoading = value; // Setting loading state.
    (context as Element).markNeedsBuild(); // Forcing UI rebuild to reflect loading state changes.
  }

  void dispose() { // Cleaning up controllers when no longer needed.
    emailController.dispose();
    passwordController.dispose();
  }
}
