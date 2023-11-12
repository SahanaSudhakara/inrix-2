import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginWithEmail() async {
    try {
      final headers = {'Content-Type': 'application/json'};
      final baseUrl = 'your_base_url'; // Replace with your actual base URL
      final loginEndpoint = '/account/login';

      final Map<String, dynamic> body = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      final response = await post(
        Uri.parse(baseUrl + loginEndpoint),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['code'] == 0) {
          // Successful login
          final token = data['token'];
          // Save token locally or perform desired actions
          print('Token: $token');
        } else {
          // Handle login failure
          final errorMessage = data['message'];
          print('Login failed: $errorMessage');
        }
      } else {
        // Handle other HTTP status codes
        print('HTTP Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle exceptions
      print('Error: $error');
    }
  }
}
