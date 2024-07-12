import 'package:flutter/material.dart';
import 'package:flutter_app/core/app_export.dart';

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

  Future<void> _findVenues(BuildContext context) async {
    // setState(() {
    //   _isLoading = true;
    // });

    Navigator.pushNamed(context, AppRoutes.searchPage);

    // setState(() {
    //   _isLoading = false;
    // });
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
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset(
                    "assets/images/finder_soccer_field.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40.0,
                  left: 16.0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.2 -
                      12.0, // Center the text
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
                    onProcess: _findVenues,
                    backgroundColor: AppColors.darkGreen,
                    textStyle: AppTextStyles.interWhiteNormal14,
                  ),
                ],
              ),
            ),
            forYou(),
            nearYou()
          ],
        ),
      ),
    );
  }
}

Container forYou() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("For You"), Text("See All")],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              forYouVenue(
                "assets/dummies/home_for_you/pingpong.png",
                "PingPong ABC",
                "Rp.15k/hr",
                "South Jakarta",
              ),
              forYouVenue(
                "assets/dummies/home_for_you/soccer.png",
                "Soccer PRO SS",
                "Rp.15k/hr",
                "West Jakarta",
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Container forYouVenue(String venue_image_path, String venue_name,
    String venue_price, String venue_place) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      children: [
        AppItemRounded(
          imagePath: venue_image_path,
          borderRadius: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              venue_name,
              style: TextStyle(fontSize: 12),
            ),
            Text(
              venue_price,
              style: TextStyle(fontSize: 8),
            ),
          ],
        ),
        Text(
          venue_place,
          style: TextStyle(fontSize: 8),
        )
      ],
    ),
  );
}

Container nearYou() {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Near You",
          style: AppTextStyles.interBlackBold15,
        ),
        SizedBox(height: 20),
        nearYouVenue(
          "assets/dummies/home_near_you/football.png",
          "Football Venue XXX",
          "Rp. 20k/hr",
          "South Jakarta",
        ),
        nearYouVenue(
          "assets/dummies/home_near_you/badminton.png",
          "Badminton LEGEND",
          "Rp. 20k/hr",
          "South Jakarta",
        )
      ],
    ),
  );
}

Container nearYouVenue(String venue_img_path, String venue_name,
    String venue_price, String venue_place) {
  return Container(
    child: Column(
      children: [
        AppItemRounded(
          imagePath: venue_img_path,
          borderRadius: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(venue_name),
                Text(venue_place),
              ],
            ),
            Text(venue_price),
          ],
        ),
      ],
    ),
  );
}
