import 'package:flutter/material.dart';

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
                    carType = value;
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
                    licensePlate = value;
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
                    dlNumber = value;
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
                    place = value;
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process the form data
                        // For demonstration purposes, just print the data
                        print('Car Type: $carType');
                        print('License Plate: $licensePlate');
                        print('DL Number: $dlNumber');
                        print('Place: $place');
                        print('From: ${widget.fromLocation}');
                        print('To: ${widget.toLocation}');
                        print('Date: ${widget.selectedDate.toLocal()}');
                        print('Time: ${widget.selectedTime.format(context)}');

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
