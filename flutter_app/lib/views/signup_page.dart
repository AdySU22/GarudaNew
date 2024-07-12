import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back))
        ],
      )
    ));
  }
}
