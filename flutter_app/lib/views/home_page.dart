import 'package:flutter/material.dart';
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
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage:
                  // widget.user.picture != null
                  //     ? NetworkImage(widget.user.picture!)
                  //     :
                  AssetImage('assets/default_profile.png') as ImageProvider,
            ),
            SizedBox(width: 10),
            Text('Welcome, ${widget.user.name}'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search venues...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            pickASport(),
            specialOffers(),
          ],
        ),
      ),
    );
  }

  Widget pickASport() {
    // List of image paths
    final List<String> sportImages = [
      'assets/dummies/home_pick_sport/badminton.png',
      'assets/dummies/home_pick_sport/Baseball.png',
      'assets/dummies/home_pick_sport/basketball.png',
      'assets/dummies/home_pick_sport/Boxing.png',
      'assets/dummies/home_pick_sport/Chess.png',
      'assets/dummies/home_pick_sport/esports.png',
      'assets/dummies/home_pick_sport/football.png',
      'assets/dummies/home_pick_sport/Gymming.png',
      'assets/dummies/home_pick_sport/swimming.png',
      // Add more image paths as needed
    ];

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick A Sport",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 10),
          Container(
            height: 200, // Adjust the height as needed
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of rows
                childAspectRatio: 1, // Adjust the aspect ratio as needed
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: sportImages.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(sportImages[index]),
                      fit: BoxFit.cover,
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
      child: Column(
        children: [
          Text(
            "Special Offers",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          // SingleChildScrollView(
          // )
        ],
      ),
    );
  }

  Container forYou() {
    return Container(
        child: Column(children: [
      Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
        children: [
          Text("For You"),
          Text("See All")
        ],
      )),
      SingleChildScrollView(
        child: Row(
          children: [],
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
          // Image.asset(),
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
