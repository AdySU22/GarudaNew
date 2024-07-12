import 'package:flutter/material.dart';
import 'package:flutter_app/controller/login_controller.dart';
import 'package:flutter_app/core/app_export.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController _loginController;
  bool _obscureText = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loginController = LoginController();
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  AppColors.lightGreen,
                  Colors.white,
                ],
              ),
            ),
            child: Center(
              child: Container(
                width: 323,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(153, 255, 255, 255),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            const Text(
                              "Login",
                              style: AppTextStyles.interBlackBold32
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Enter your email and password to log in",
                              style: AppTextStyles.interGreyNormal12,
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: _loginController.formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 24),
                            TextFormField(
                              controller: _loginController.emailController,
                              decoration: InputDecoration(
                                labelText: 'Email*',
                                labelStyle: AppTextStyles.interBlackMedium14,
                                isDense: true,
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                // Basic email validation
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 12),
                            TextFormField(
                              controller: _loginController.passwordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                labelText: 'Password*',
                                labelStyle: AppTextStyles.interBlackMedium14,
                                isDense: true,
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText ? Icons.visibility : Icons.visibility_off,
                                  ),
                                  onPressed: _togglePasswordVisibility,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _rememberMe,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _rememberMe = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      "Remember me",
                                      style: AppTextStyles.interGreyNormal12
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Forgot Password?",
                                    style: AppTextStyles.interBlueMedium12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: AppColors.darkGreen,
                                minimumSize: Size(MediaQuery.of(context).size.width, 48),
                              ),
                              onPressed: () async {
                                try {
                                  await _loginController.login(context);
                                  // Navigate to the next screen on successful login
                                } catch (error) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(error.toString())),
                                  );
                                }
                              },
                              child: _loginController.isLoading
                                  ? CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    )
                                  : Text(
                                      "Log In",
                                      style: AppTextStyles.interWhiteNormal14,
                                    ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(24),
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: AppTextStyles.interGreyNormal12,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, AppRoutes.signupPage);
                                  },
                                  child: Text("Sign Up", style: AppTextStyles.interBlueMedium12),
                                ),
                              ],
                            ),
                        )],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
