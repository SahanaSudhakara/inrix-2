import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostRide extends StatefulWidget {
  const PostRide({
    Key? key,
    required this.title,
    required this.userName,
    required this.userEmail,
    required this.fromLocation,
    required this.toLocation,
    required this.selectedDate,
    required this.selectedTime,
  }) : super(key: key);

  final String title;
  final String userName;
  final String userEmail;
  final String fromLocation;
  final String toLocation;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  @override
  _PostRideState createState() => _PostRideState();
}

class _PostRideState extends State<PostRide> {
  final _formKey = GlobalKey<FormState>();

  String carType = '';
  String licensePlate = '';
  String dlNumber = '';
  String place = '';

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Car Type'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Car Type';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      carType = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'License Plate'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter License Plate';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      licensePlate = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'DL Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter DL Number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      dlNumber = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Place'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Place';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      place = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text('From: ${widget.fromLocation}'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text('To: ${widget.toLocation}'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text('Selected Date: ${widget.selectedDate.toLocal()}'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text('Selected Time: ${widget.selectedTime.format(context)}'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submitForm,
                    child: _isLoading ? const CircularProgressIndicator() : const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Process the form data
      print('Car Type: $carType');
      print('License Plate: $licensePlate');
      print('DL Number: $dlNumber');
      print('Place: $place');
      print('From: ${widget.fromLocation}');
      print('To: ${widget.toLocation}');
      print('Date: ${widget.selectedDate.toLocal()}');
      print('Time: ${widget.selectedTime.format(context)}');

      // Simulate the API call delay
      await Future.delayed(const Duration(seconds: 2));

      // Call the controller to post the ride
      await _postRide();

      // Show success popup
      _showSuccessPopup();

      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<bool> _postRide() async {
    final Uri uri = Uri.parse('http://54.196.10.40:8080/ride/post');

    final Map<String, dynamic> requestBody = {
    'user_id': 6,
    'car_type': carType,
    'license_plate': licensePlate,
    'dl': dlNumber,
    'date_time': widget.selectedDate
        .add(Duration(hours: widget.selectedTime.hour, minutes: widget.selectedTime.minute))
        .toUtc()
        .toIso8601String(),
    'price': 100,
    'from_address': widget.fromLocation,
    'from_lat': 79.2131143,
    'from_long': 81.9284021,
    'to_address': widget.toLocation,
      'to_lat': 86.2131143,
      'to_long': 81.92841313,
    };

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print('Ride posted successfully');
        return true;
      } else {
        // Handle error response
        print('Failed to post ride. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        return false;
      }
    } catch (error) {
      // Handle network or unexpected errors
      print('Error posting ride: $error');
      return false;
    }
  }

  void _showSuccessPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Ride posted successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Go back to the home screen
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
