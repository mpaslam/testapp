// // auth_event.dart

// import 'package:equatable/equatable.dart';

// class AuthEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class Authinitialevent extends AuthEvent{}
// class LoginEvent extends AuthEvent {
//   final String email;
//   final String password;

//   LoginEvent(this.email, this.password);

//   @override
//   List<Object?> get props => [email, password];
// }

import 'package:flutter/material.dart';


@immutable
abstract class UserLoginEvent {}

class UserLoginRequested extends UserLoginEvent {
  final String email;
  final String password;

  UserLoginRequested(this.email, this.password);
}
