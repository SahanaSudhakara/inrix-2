import 'package:flutter/material.dart';
import 'controller/registration_controller.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  RegistrationController _registrationController = RegistrationController();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registration Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _registrationController.firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: 16.0),
              TextField(
                controller: _registrationController.lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: 16.0),
              TextField(
                controller: _registrationController.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: 16.0),
              TextField(
                controller: _registrationController.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _registrationController.isLoading.value
                    ? null
                    : () async {
                  await _registrationController.registerUser();
                  // Additional actions after registration button click
                  if (_registrationController.isLoading.value) {
                    // For example, show a loading indicator
                    // or disable additional buttons
                  } else {
                    // Registration is complete, navigate to another screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NextScreen()),
                    );
                  }
                },
                child: _registrationController.isLoading.value
                    ? CircularProgressIndicator() // Show a loading indicator
                    : Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Text('Registration Complete!'),
      ),
    );
  }
}
