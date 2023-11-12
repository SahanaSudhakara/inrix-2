import 'package:cargogo/pages/post_ride.dart';
import 'package:cargogo/pages/search_ride.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 200.0),
            // "From" Input Field
             const TextField(
              decoration:  InputDecoration(
                labelText: 'From',
  


                border: OutlineInputBorder(),
              ),
             

                
            ),
            const SizedBox(height: 16.0),

            // "To" Input Field
            const TextField(
              decoration: InputDecoration(
                labelText: 'To',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Select Date Button
            Container(
              width: 100, // Set the desired width
              child: ElevatedButton(
                onPressed: () => _selectDate(context),
                 style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Select Date',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    
                  ),),
              ),
            ),
            const SizedBox(height: 8.0),
            // Text('Selected Date: ${selectedDate.toLocal()}'),
           

            // Select Time Button
            Container(
              width: 100, // Set the desired width
              child: ElevatedButton(
                onPressed: () => _selectTime(context),
                 style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Select Time',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    
                  ),),
              ),
            ),
            const SizedBox(height: 8.0),
             Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: null,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate.toLocal())}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: null,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Selected Time: ${selectedTime.format(context)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            // Text('Selected Time: ${selectedTime.format(context)}'),

            // Search Button
            Container(
              width: 100, // Set the desired width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchRideContent()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal 
                          )          ),
                child: const Text('Search Ride'),
              ),
            ),
            const SizedBox(height: 16.0),

            // New Ride Button
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PostRide(
                        title: 'PostRide',
                        userName: "sds",
                        userEmail: "dsds",
                        fromLocation: "From Location", // Replace with the actual value
                        toLocation: "To Location",     // Replace with the actual value
                        selectedDate: selectedDate,
                        selectedTime: selectedTime,
                      );
                    },
                  ),
                );
              },
               style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal  
              ) ),  
              child: const Text('New Ride'),
            ),
          ],
        ),
      ),
    );
  }
}
