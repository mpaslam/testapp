import 'dart:convert';

import 'package:app/models/model.dart';

import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = "https://respos.menuclub.uk";

  Future<LoginModel?> userlogIn(String email, String password) async {
    var response = await http.post(Uri.parse("$baseUrl/api/loginApp"),
        body: {"email": email, "password": password});

    if (response.statusCode == 201) {
      LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));
      return loginModel;
    }
    return null;
  }
}
