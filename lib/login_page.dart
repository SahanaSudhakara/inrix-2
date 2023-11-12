import 'package:flutter/material.dart';
import 'registration_page.dart';
import 'navbar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the login header
      // appBar: AppBar(
      //   title: Text('Login Page'),
      // ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Contrast font and buttons with white
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Implement your login logic here
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  // Perform login validation and authentication
                  print('Email: $email, Password: $password');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Navbar()),
                  );
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                ),
              ),

              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Navigate to the RegistrationPage when the link is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                },
                child: Text('Don\'t have an account? Register here'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
