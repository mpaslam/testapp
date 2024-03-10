part of 'user_login_cubit.dart';

@immutable
sealed class UserLoginState {}

final class UserLoginInitial extends UserLoginState {}

final class UserLoginLoading extends UserLoginState {}

final class UserLoginLoaded extends UserLoginState {
  final LoginModel loginModel;
  UserLoginLoaded(this.loginModel);
}

final class UserLoginError extends UserLoginState {}
