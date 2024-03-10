// // auth_state.dart

// import 'package:app/models/model.dart';
// import 'package:equatable/equatable.dart';

// class AuthState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class AuthInitial extends AuthState {}

// class AuthLoading extends AuthState {}

// class AuthError extends AuthState {}

// class AuthSucsess extends AuthState {
//   final List<Model> sucsess;

//   AuthSucsess({required this.sucsess});
// }

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