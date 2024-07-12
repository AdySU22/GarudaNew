import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart'; // Import your User model

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text("Name"),
                  Text(widget.user.name),
                  Text("Contact"),
                  Text(widget.user.telp),
                  Text("Email"),
                  Text(widget.user.email),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
