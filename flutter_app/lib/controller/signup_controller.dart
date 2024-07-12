import 'dart:convert'; // Importing Dart's convert library for JSON encoding/decoding.
import 'package:flutter/material.dart'; // Importing Flutter's material design components.
import 'package:flutter_app/core/constants/api_constant.dart';
import 'package:http/http.dart' as http; // Importing HTTP client for making API requests.
import 'package:shared_preferences/shared_preferences.dart'; // Importing shared preferences for local storage.
import '../models/user.dart'; // Importing the User model.
import '../routes/app_routes.dart'; // Importing application routes. Make sure to check the correct import path.

class SignupController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Form key for form validation.
  final TextEditingController firstNameController = TextEditingController(); // Controller for first name input.
  final TextEditingController lastNameController = TextEditingController(); // Controller for last name input.
  final TextEditingController emailController = TextEditingController(); // Controller for email input.
  final TextEditingController phoneController = TextEditingController(); // Controller for phone number input.
  final TextEditingController passwordController = TextEditingController(); // Controller for password input.

  bool _isLoading = false; // State variable to track loading state.

  bool get isLoading => _isLoading; // Getter to access loading state.

  Future<void> signup(BuildContext context) async {
    if (!formKey.currentState!.validate()) return; // Validate form input.

    _setLoading(true, context); // Set loading state to true.

    final url = Uri.parse(APIConstant.signupRoute); // API endpoint for signup.
    final response = await http.post( // Making a POST request to the signup endpoint.
      url,
      headers: {'Content-Type': 'application/json'}, // Setting headers for JSON content.
      body: json.encode({ // Encoding user data as JSON.
        'name': '${firstNameController.text} ${lastNameController.text}',
        'email': emailController.text,
        'telp': phoneController.text,
        'password': passwordController.text,
      }),
    );

    _setLoading(false, context); // Set loading state to false after API call.

    if (response.statusCode == 200) { // Checking if the API call was successful.
      final responseData = json.decode(response.body); // Decoding response JSON.
      final user = User.fromJson(responseData); // Creating a User model object from response data.

      // Saving authentication token to SharedPreferences for persistent storage.
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.token);

      // Navigating to the home page and passing the User model as arguments.
      Navigator.pushReplacementNamed(context, AppRoutes.homePage, arguments: user);
    } else { // Handling errors if the API call fails.
      final error = json.decode(response.body); // Decoding error message from JSON.
      ScaffoldMessenger.of(context).showSnackBar( // Displaying error message as a snack bar.
        SnackBar(content: Text(error['message'])),
      );
    }
  }

  void _setLoading(bool value, BuildContext context) {
    _isLoading = value; // Setting loading state.
    (context as Element).markNeedsBuild(); // Forcing UI rebuild to reflect loading state changes.
  }

  void dispose() { // Cleaning up controllers when no longer needed.
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }
}
