import 'dart:convert';
import 'dart:io';

import 'package:app/models/model.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ApiService {
  ApiService() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  String baseUrl = "https://respos.menuclub.uk/api/loginApp/";
  final Dio dio = Dio();

  Future<LoginModel?> userlogIn(String email, String password) async {
    final Map<String, String> data = {
      'email': email,
      'password': password,
    };

    try {
      final Response response = await dio.post(
        '$baseUrl',
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseData = response.data;

        if (responseData != null) {
          print('Login Success');
          print('Access Token: ${responseData['token']['access']}');
          print('Refresh Token: ${responseData['token']['refresh']}');

          LoginModel loginModel = LoginModel.fromJson(responseData);
          print('user name=====${loginModel.userData.username}');
          return loginModel;
        } else {
          print('Error: Response data is null');
        }
      } else {
        print('Error: ${response.statusCode}');
      }

      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
