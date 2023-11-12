import 'package:flutter/material.dart';

class Trips extends StatelessWidget {
  final List<Map<String, dynamic>> pastTrips = [
    {"Date": "20th August 2022", "from": "San Francisco","to":"San jose"},
    {"Date": "30th September 2022", "from": "San jose","to":"San Francisco"},
     {"Date": "28th October 2022", "from": "San Francisco","to":"San jose"},
      {"Date": "20th August 2022", "from": "San jose","to":"San Francisco"},
    {"Date": "30th September 2022", "from": "San jose","to":"Los angeles"},
     {"Date": "28th October 2022", "from": "San Francisco","to":"Los angeles"},
      {"Date": "20th August 2022", "from": "San Francisco","to":"Los angeles"},
    {"Date": "30th September 2022", "from": "San jose","to":"San Francisco"},
     {"Date": "28th October 2022", "from": "Los angeles","to":"San jose"},
    // Add more trip objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: pastTrips.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildTripContainer(pastTrips[index]);
          },
        ),
      ),
    );
  }

  Widget _buildTripContainer(Map<String, dynamic> trip) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              './assets/map.jpg', // Replace with your image path
              width: 430, // Set the desired width for the image
              height: 110, // Set the desired height for the image
              fit: BoxFit.cover, // Ensure the image covers the entire box
              // You can adjust other properties like alignment if needed
            ),
          const SizedBox(height: 16),
          Text(
            'Date: ${trip['Date']}',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'From: ${trip['from']}',
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
           Text(
            'To: ${trip['to']}',
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
