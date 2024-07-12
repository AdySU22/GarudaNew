import 'package:flutter/material.dart';
import 'package:flutter_app/core/app_export.dart';
import '../models/user.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGreen,
        elevation: 0,
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(
            'assets/images/user_image.png',
          ),
        ),
        title: Text(
          "Welcome ${widget.user.name}",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.lightGreen, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search venues...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  pickASport(),
                  specialOffers(),
                  forYou(),
                  nearYou(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pickASport() {
    final List<Map<String, dynamic>> sports = [
      {"name": "Football", "image": "assets/dummies/home_pick_sport/football.png"},
      {"name": "Swimming", "image": "assets/dummies/home_pick_sport/swimming.png"},
      {"name": "Basketball", "image": "assets/dummies/home_pick_sport/basketball.png"},
      {"name": "Gymming", "image": "assets/dummies/home_pick_sport/Gymming.png"},
      {"name": "Rugby", "image": "assets/dummies/home_pick_sport/Rugby.png"},
      {"name": "Tennis", "image": "assets/dummies/home_pick_sport/tennis.png"},
      {"name": "Boxing", "image": "assets/dummies/home_pick_sport/Boxing.png"},
      {"name": "Table Tennis", "image": "assets/dummies/home_pick_sport/Table tennis.png"},
      {"name": "Esports", "image": "assets/dummies/home_pick_sport/esports.png"},
      {"name": "Chess", "image": "assets/dummies/home_pick_sport/Chess.png"},
      {"name": "Badminton", "image": "assets/dummies/home_pick_sport/badminton.png"},
      // Add more sports as needed
    ];

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pick A Sport", style: AppTextStyles.interBlackBold15),
          SizedBox(height: 10),
          Container(
            height: 250,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: sports.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.venueFinderPage);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        AppItemRounded(
                          imagePath: sports[index]['image'],
                          borderRadius: 10.0, // Adjust border radius as needed
                        ),
                        SizedBox(height: 5),
                        Text(
                          sports[index]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // Style definition for text below the image
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container specialOffers() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Special Offer", style: AppTextStyles.interBlackBold15),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                specialOfferItem("assets/dummies/home_special_offers/basketball.png", "50% off"),
                specialOfferItem("assets/dummies/home_special_offers/swimpool.png", "25% off"),
                specialOfferItem("assets/dummies/home_special_offers/basketball.png", "40% off"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget specialOfferItem(String imagePath, String offers) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Stack(
        children: [
          AppItemRounded(
            imagePath: imagePath,
            borderRadius: 15.0,
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                ),
              ),
              child: Text(
                offers,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
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

  Container forYouVenue(String venue_image_path, String venue_name, String venue_price, String venue_place) {
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

  Container nearYouVenue(String venue_img_path, String venue_name, String venue_price, String venue_place) {
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
}
