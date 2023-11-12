import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Future<Position?> getCurrentPosition() async {
    try {
      // Get the current position of the device
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return position;
    } catch (e) {
      print("Error getting location: $e");
      return null; // Return null in case of an error
    }
  }
}
