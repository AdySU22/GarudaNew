import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class WelcomingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate 90% of the smaller dimension (width or height)
    double imageWidth = screenWidth * 0.8;
    double imageHeight = screenHeight * 0.5;

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0XFFA7FF87), Color(0XFFFFFFFF)],
        ),
      ),
      child: Stack(children: [
        Image.asset(
          ImageConstant.welcomingImgPath,
          width: imageWidth,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                """Dive into a smarter way to experience your city. 
With CitySport Booking, reserving sport centers 
and venues is just a tap away""",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Change to your desired background color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0), // Radius border
                ),
              ),
              onPressed: () {
                // Navigate to explore screen or perform any action
              },
              child: const Text('EXPLORE!'),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors
                          .blue, // Change to your desired background color
                      foregroundColor: Colors.white, // Text color
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(100.0), // Radius border
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.loginPage);
                    },
                    child: Text("Login")),
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors
                          .blue, // Change to your desired background color
                      foregroundColor: Colors.white, // Text color
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(100.0), // Radius border
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signupPage);
                    },
                    child: Text("Sign Up")),
              ],
            ),
          ],
        ),
      ]),
    ));
  }
}
