import 'package:flutter/material.dart';

class ConfirmationPage extends StatefulWidget {
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'), // App bar title set to 'Confirmation'
      ),
      body: Center(
        child: Text('Confirmation Page'), // Centered text widget displaying 'Confirmation Page'
      ),
    );
  }
}
