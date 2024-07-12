import 'package:flutter/material.dart';

class PropertyRegisterPage extends StatefulWidget {
  @override
  _PropertyRegisterPageState createState() => _PropertyRegisterPageState();
}

class _PropertyRegisterPageState extends State<PropertyRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Register'),
      ),
      body: Center(
        child: Text('Property Register Page'),
      ),
    );
  }
}
