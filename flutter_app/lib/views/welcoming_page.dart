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
          end: Alignment.center,
          colors: [Color(0XFFA7FF87), Color(0XFFFFFFFF)],
        ),
      ),
      child: Stack(children: [
        Center(child:Image.asset(
          ImageConstant.welcomingImgPath,
          width: imageWidth,
        )),
        Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
                """Dive into a smarter way to experience your city. 
With CitySport Booking, reserving sport centers 
and venues is just a tap away""",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            SizedBox(height: 250),
            Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 61),
                backgroundColor: AppColors.darkGreen, 
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0), // Radius border
                ),
              ),
              onPressed: () {
              
              },
              child: const Text('EXPLORE!',
                  style: AppTextStyles.interWhiteMedium14),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.lightpink, 
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
                    child: Text("Login", style: AppTextStyles.opSansBlueGrayNormal20,)),
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.lightpink,
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
                    child: Text("Sign Up", style: AppTextStyles.opSansBlueGrayNormal20,)),
              ],
            ),
          ],
        ),
        )]),
    ));
  }
}
