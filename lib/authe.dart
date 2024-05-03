import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthService {
  static const String baseUrl = 'http://178.18.254.224:5953';

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/loginApp/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Login successful
      // Save session token or user data
      return true;
    } else {
      // Login failed
      // Handle error
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // Registration successful
      print('sucesssss');
      // Save session token or user data
      return true;
    } else {
      // Registration failed
      // Handle error
      return false;
    }
  }

  Future<void> logout(BuildContext context) async {
    // Perform logout actions, such as clearing session data
    // Navigate back to login screen or any other desired screen
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
