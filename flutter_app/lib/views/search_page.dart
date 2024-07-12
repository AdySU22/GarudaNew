import 'package:flutter/material.dart';
import 'package:flutter_app/core/app_export.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0), // Set the preferred height here
        child: AppBar(
          title: Text('We\'ve found it.'),
          backgroundColor: AppColors.darkGreen,
          centerTitle: true, // Center the title vertically
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Your content here
            ],
          ),
        ),
      ),
    );
  }
}
