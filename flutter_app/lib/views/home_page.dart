import 'package:flutter/material.dart';
import 'package:flutter_app/core/app_export.dart';
import '../models/user.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGreen, // Set the AppBar color
        elevation: 0,
        leading: 
            CircleAvatar(
              radius: 25,
              backgroundImage: 
                  // widget.user.picture != null
                  //     ? NetworkImage(widget.user.picture!)
                  //     :
                  AssetImage('assets/images/user_image.png') as ImageProvider,
        ),
        title: Text("Welcome ${widget.user.name}", style: TextStyle(color: Colors.black),),
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
                  borderSide: BorderSide.none, // Remove border
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
                  forYou()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget pickASport() {
  // List of maps containing sport name and image path
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
        Text(
          "Pick A Sport",
          style: AppTextStyles.interBlackBold15
        ),
        SizedBox(height: 10),
        Container(
          height: 250, // Adjusted height to accommodate text below images
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
              return Container(
                width: 50,
                height: 50,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(sports[index]['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      sports[index]['name'],
                      textAlign: TextAlign.center,
                      // Style definition for text below the image
                    ),
                  ],
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
        Text(
          "Special Offer",
          style: AppTextStyles.interBlackBold15
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children:[
            specialOfferItem("assets/dummies/home_special_offers/basketball.png", "50% off"),
            specialOfferItem("assets/dummies/home_special_offers/swimpool.png", "25% off"),
            specialOfferItem("assets/dummies/home_special_offers/basketball.png", "40% off"),
            
          ]),
        )]
    ),
  );
  }

  Widget specialOfferItem(String imagePath, String offers){
    return Padding(
      padding: EdgeInsets.all(5),
      child: Stack(
  children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(imagePath),
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
));

  }
  Container forYou() {
    return Container(
        child: Column(children: [
      Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [Text("For You"), Text("See All")],
          )),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            forYouVenue("assets/dummies/home_for_you/pingpong.png", "PingPong ABC", "Rp.15k/hr", "South Jakarta"),
            forYouVenue("assets/dummies/home_for_you/soccer.png", "Soccer PRO SS", "Rp.15k/hr", "West Jakarta")
          ],
        ),
      )
    ]));
  }

  Container forYouVenue(String venue_image_path, String venue_name,
      String venue_price, String venue_place) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(venue_image_path),
    ),          Row(
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

  Container nearYouVenue(String venue_img_path, String venue_name,
      String venue_price, String venue_place) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(venue_name),
              Text(venue_price),
            ],
          ),
          Text(venue_place)
        ],
      ),
    );
  }
}
