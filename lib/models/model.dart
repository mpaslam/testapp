// model.dart

import 'dart:convert';

class HomePageModel {
  final Token token;
  final UserData userData;
  final String msg;

  HomePageModel({
    required this.token,
    required this.userData,
    required this.msg,
  });

  factory HomePageModel.fromMap(Map<String, dynamic> map) {
    return HomePageModel(
      token: Token.fromMap(map['token'] ?? {}),
      userData: UserData.fromMap(map['userData'] ?? {}),
      msg: map['msg'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token.toMap(),
      'userData': userData.toMap(),
      'msg': msg,
    };
  }

  String toJson() => json.encode(toMap());

  factory HomePageModel.fromJson(String source) =>
      HomePageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HomePageModel(token: $token, userData: $userData, msg: $msg)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomePageModel &&
        other.token == token &&
        other.userData == userData &&
        other.msg == msg;
  }

  @override
  int get hashCode {
    return token.hashCode ^ userData.hashCode ^ msg.hashCode;
  }
}

class Token {
  final String refresh;
  final String access;

  Token({
    required this.refresh,
    required this.access,
  });

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      refresh: map['refresh'] ?? '',
      access: map['access'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'refresh': refresh,
      'access': access,
    };
  }
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

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] ?? 0,
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      waiter: map['waiter'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'waiter': waiter,
    };
  }
}
