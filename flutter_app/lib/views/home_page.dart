import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
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

  Container pickASport() {
    return Container(
      child: Column(children: [
        Text("Pick A Sport"),
        // SingleChildScrollView(
        //   child: Row(
        //     children: [],
        //   ),
        // )
      ]),
    );
  }

  Container specialOffers(){
    return Container(
      child: Column(children: [
        Text("Special Offers"),
        // SingleChildScrollView(
          
        // )
      ]),      
    );
  }
}
