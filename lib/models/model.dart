// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final Token token;
  final UserData userData;
  final String msg;

  LoginModel({
    required this.token,
    required this.userData,
    required this.msg,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: Token.fromJson(json["token"]),
        userData: UserData.fromJson(json["user_data"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "token": token.toJson(),
        "user_data": userData.toJson(),
        "msg": msg,
      };
}

class Token {
  final String refresh;
  final String access;

  Token({
    required this.refresh,
    required this.access,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}

class UserData {
  final int id;
  final String username;
  final String email;
  final bool waiter;

  UserData({
    required this.id,
    required this.username,
    required this.email,
    required this.waiter,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        waiter: json["waiter"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "waiter": waiter,
      };
}
