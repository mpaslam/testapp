import 'package:flutter/material.dart';

@immutable
abstract class UserLoginEvent {}

class UserLoginRequested extends UserLoginEvent {
  final String email;
  final String password;

  UserLoginRequested(this.email, this.password);
}
