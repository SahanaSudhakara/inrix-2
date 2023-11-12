import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/geolocator_service.dart';

class ApplicationBlock with ChangeNotifier {
  Position? _currentLocation;

  Position? get currentLocation => _currentLocation;

  ApplicationBlock() {
    // Initialize your block, fetch initial data, or perform any setup here
    // For example, you might want to call a method to get the current location
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Use the GeolocatorService to get the current location
      _currentLocation = await GeolocatorService().getCurrentPosition();
      // Notify listeners that the state has changed
      notifyListeners();
    } catch (e) {
      print("Error getting location: $e");
      // Handle errors as needed
    }
  }
}
