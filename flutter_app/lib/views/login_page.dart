import 'package:flutter/material.dart';
import 'package:flutter_app/controller/login_controller.dart';
import 'package:flutter_app/core/app_export.dart';
import 'package:flutter_app/widgets/AppButton.dart';
import 'package:flutter_app/widgets/AppTextField.dart'; // Import the AppTextField class

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
                            const Text("Login",
                                style: AppTextStyles.interBlackBold32),
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
                            AppTextField(
                              controller: _loginController.emailController,
                              labelText: 'Email*',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                // Basic email validation
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 12),
                            AppTextField(
                              controller: _loginController.passwordController,
                              labelText: 'Password*',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              isPassword: true,
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
                                    Text("Remember me",
                                        style: AppTextStyles.interGreyNormal12),
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
                            AppButton(
                              isLoading: _loginController.isLoading,
                              onProcess: _loginController.login,
                              backgroundColor:
                                  AppColors.darkGreen, // Use your custom color
                              textStyle: AppTextStyles
                                  .interWhiteNormal14, // Use your custom text style
                              buttonText: "Log In", // Customize button text
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
                                      Navigator.pushNamed(
                                          context, AppRoutes.signupPage);
                                    },
                                    child: Text("Sign Up",
                                        style: AppTextStyles.interBlueMedium12),
                                  ),
                                ],
                              ),
                            )
                          ],
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
