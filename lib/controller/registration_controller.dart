import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;

  Future<void> registerUser() async {
    try {
      isLoading.value = true; // Set loading to true during API call

      final headers = {'Content-Type': 'application/json', 'Access-Control-Allow-Origin' : '*'};
      const baseUrl = 'http://54.196.10.40:8080'; // Replace with your actual base URL
      const registrationEndpoint = "/auth/register";

      final Map<String, dynamic> body = {
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      };

      print(body);

      final response = await http.post(
        Uri.parse(baseUrl + registrationEndpoint),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        if (data['code'] == 0) {
          // Successful registration
          final token = data['token'];
          // Save token locally or perform desired actions
          print('Token: $token');
        } else {
          // Handle registration failure
          final errorMessage = data['message'];
          print('Registration failed: $errorMessage');
        }
      } else {
        // Handle other HTTP status codes
        print('HTTP Error: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      // Handle ClientException (e.g., network error)
      print('ClientException here: $e');
    } catch (error) {
      // Handle other exceptions
      print('Error: $error');
    } finally {
      isLoading.value = false; // Set loading back to false after API call
    }
  }
}
