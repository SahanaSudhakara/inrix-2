import 'dart:async';

class Authentication {
  static Future<Map<String, dynamic>> login(Map<String, dynamic> body) async {
    // Simulate a login request (replace this with your actual login logic)
    await Future.delayed(Duration(seconds: 2));

    // Mock login success for demonstration purposes
    bool loginSuccess = true;

    if (loginSuccess) {
      // Return a Map with token and code
      return {'token': 'your_token', 'code': 0};
    } else {
      // Return a Map with error message and code
      return {'message': 'Invalid credentials', 'code': 1};
    }
  }
}
