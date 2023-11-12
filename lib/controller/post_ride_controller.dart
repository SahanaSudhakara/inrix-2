import 'dart:convert';
import 'package:http/http.dart' as http;

class PostRideController {

  static Future<void> postRide({
    required int userId,
    required String carType,
    required String licensePlate,
    required String dlNumber,
    required DateTime dateTime,
    required double price,
    required String fromAddress,
    required double fromLat,
    required double fromLong,
    required String toAddress,
    required double toLat,
    required double toLong,
  }) async {
    final Uri uri = Uri.parse('http://54.196.10.40:8080/ride/post');

    final Map<String, dynamic> requestBody = {
      'user_id': userId,
      'car_type': carType,
      'license_plate': licensePlate,
      'dl': dlNumber,
      'date_time': dateTime.toUtc().toIso8601String(),
      'price': price,
      'from_address': fromAddress,
      'from_lat': fromLat,
      'from_long': fromLong,
      'to_address': toAddress,
      'to_lat': toLat,
      'to_long': toLong,
    };

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      // Handle successful response
      print('Ride posted successfully');
    } else {
      // Handle error response
      print('Failed to post ride. Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  }
}
