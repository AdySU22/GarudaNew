import 'package:flutter/material.dart';
import 'package:flutter_app/core/app_export.dart'; // Ensure this import works in your project

class VenueFinderPage extends StatefulWidget {
  @override
  _VenueFinderPageState createState() => _VenueFinderPageState();
}

class _VenueFinderPageState extends State<VenueFinderPage> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _memberController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;

  Future<void> _findFootballFields(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    // Your logic for finding football fields goes here

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4, // Adjust the height as needed
                  child: Image.asset(
                    "assets/images/finder_soccer_field.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40.0, // Adjust as necessary for your layout
                  left: 16.0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.2 - 12.0, // Center the text
                  left: 0,
                  right: 0,
                  child: Text(
                    "Soccer Field",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AppTextField(
                    controller: _locationController,
                    labelText: "Location",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a location';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  AppTextField(
                    controller: _timeController,
                    labelText: "Time",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a time';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  AppTextField(
                    controller: _memberController,
                    labelText: "Member",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter member count';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  AppTextField(
                    controller: _phoneController,
                    labelText: "Phone",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 32.0),
                  AppButton(
                    buttonText: "Find football field",
                    isLoading: _isLoading,
                    onProcess: _findFootballFields,
                    backgroundColor: AppColors.darkGreen, // Ensure this is defined in your project
                    textStyle: AppTextStyles.interWhiteNormal14, // Ensure this is defined in your project
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
