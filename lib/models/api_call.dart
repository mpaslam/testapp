// api_call.dart

import 'dart:convert';
import 'package:app/models/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class HomePageRepository {
  Future<HomePageModel> fetchDetails(String email, String password);
}

class HomepageRepo extends HomePageRepository {
  @override
  Future<HomePageModel> fetchDetails(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("https://respos.menuclub.uk/api/loginApp/"),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 201) {
        print('success');
        final Map<String, dynamic> responseData = json.decode(response.body);
        return HomePageModel.fromMap(responseData);
      } else {
        print('error');
        debugPrint("ERROR IN API CALL ${response.statusCode}");
        throw Exception("Failed to fetch details");
      }
    } catch (error) {
      print('exception: $error');
      throw Exception("Failed to fetch details: $error");
    }
  }
}
