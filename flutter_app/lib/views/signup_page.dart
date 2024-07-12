import 'package:flutter/material.dart';
import 'package:flutter_app/controller/signup_controller.dart';
import 'package:flutter_app/core/app_export.dart';
import 'package:flutter_app/widgets/AppButton.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late SignupController _signupController;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _signupController = SignupController();
  }

  @override
  void dispose() {
    _signupController.dispose();
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
            height: MediaQuery.sizeOf(context).height,
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
                      const Column(
                        children: [
                          Text(
                            "Sign Up",
                            style: AppTextStyles.interBlackBold32,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Create an account to continue!",
                            style: AppTextStyles.interGreyNormal12,
                          ),
                        ],
                      ),
                      Form(
                        key: _signupController.formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 24),
                            AppTextField(
                              controller: _signupController.firstNameController,
                              labelText: 'First Name*',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 12),
                            AppTextField(
                              controller: _signupController.lastNameController,
                              labelText: 'Last Name*',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 12),
                            AppTextField(
                              controller: _signupController.emailController,
                              labelText: 'Email*',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 12),
                            AppTextField(
                              controller: _signupController.phoneController,
                              labelText: 'Phone Number',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                                  return 'Please enter a valid phone number';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 12),
                            AppTextField(
                              controller: _signupController.passwordController,
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
                            SizedBox(height: 20),
                            AppButton(
                              isLoading: _signupController.isLoading,
                              onProcess: _signupController.signup,
                              backgroundColor:
                                  AppColors.darkGreen, // Use your custom color
                              textStyle: AppTextStyles
                                  .interWhiteNormal14, // Use your custom text style
                              buttonText: "Register",
                            ),
                            Padding(padding: EdgeInsets.all(24), child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: AppTextStyles.interGreyNormal12,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AppRoutes.loginPage);
                                  },
                                  child: Text("Login", style: AppTextStyles.interBlueMedium12),
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
