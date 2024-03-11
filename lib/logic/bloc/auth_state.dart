
import 'package:app/models/model.dart';
import 'package:flutter/material.dart';


@immutable
abstract class UserLoginState {}

class UserLoginInitial extends UserLoginState {}

class UserLoginLoading extends UserLoginState {}

class UserLoginLoaded extends UserLoginState {
  final LoginModel loginModel;
  UserLoginLoaded(this.loginModel);
}

class UserLoginError extends UserLoginState {}