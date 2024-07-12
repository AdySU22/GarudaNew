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
      appBar: AppBar(
        title: Text('We\'ve found it.'),
        backgroundColor: AppColors.darkGreen,
      ),
      body: SafeArea(child: 
      SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      )),
    );
  }
}
