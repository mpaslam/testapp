// // main.dart
// import 'package:app/logic/bloc/auth_bloc.dart';
// import 'package:app/screens/login.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(
//     BlocProvider(
//       create: (context) => AuthBloc(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),
//     );
//   }
// }

// // login.dart
// import 'package:app/logic/bloc/auth_bloc.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login"),
//         backgroundColor: Colors.red[900],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextFormField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//                 fillColor: Colors.tealAccent,
//               ),
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             TextFormField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 fillColor: Colors.tealAccent,
//               ),
//               obscureText: true,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 BlocProvider.of<AuthBloc>(context).add(LoginEvent(
//                   _emailController.text,
//                   _passwordController.text,
//                 ));
//               },
//               child: Text('Login'),
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text(
//                 'Sign in with Google',
//                 style: TextStyle(color: Colors.black),
//               ),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//               ),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 'Forgot Password',
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // model.dart
// import 'dart:convert';

// class HomePageModel {
//   final Token token;
//   final UserData userData;
//   final String msg;

//   HomePageModel({
//     required this.token,
//     required this.userData,
//     required this.msg,
//   });

//   factory HomePageModel.fromMap(Map<String, dynamic> map) {
//     return HomePageModel(
//       token: Token.fromMap(map['token'] ?? {}),
//       userData: UserData.fromMap(map['userData'] ?? {}),
//       msg: map['msg'] ?? '',
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'token': token.toMap(),
//       'userData': userData.toMap(),
//       'msg': msg,
//     };
//   }

//   String toJson() => json.encode(toMap());

//   factory HomePageModel.fromJson(String source) =>
//       HomePageModel.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'HomePageModel(token: $token, userData: $userData, msg: $msg)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is HomePageModel &&
//         other.token == token &&
//         other.userData == userData &&
//         other.msg == msg;
//   }

//   @override
//   int get hashCode {
//     return token.hashCode ^ userData.hashCode ^ msg.hashCode;
//   }
// }

// class Token {
//   final String refresh;
//   final String access;

//   Token({
//     required this.refresh,
//     required this.access,
//   });

//   factory Token.fromMap(Map<String, dynamic> map) {
//     return Token(
//       refresh: map['refresh'] ?? '',
//       access: map['access'] ?? '',
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'refresh': refresh,
//       'access': access,
//     };
//   }
// }

// class UserData {
//   final int id;
//   final String username;
//   final String email;
//   final bool waiter;

//   UserData({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.waiter,
//   });

//   factory UserData.fromMap(Map<String, dynamic> map) {
//     return UserData(
//       id: map['id'] ?? 0,
//       username: map['username'] ?? '',
//       email: map['email'] ?? '',
//       waiter: map['waiter'] ?? false,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'username': username,
//       'email': email,
//       'waiter': waiter,
//     };
//   }
// }

// // api_call.dart
// import 'dart:convert';
// import 'package:app/models/model.dart';
// import 'package:http/http.dart' as http;

// abstract class HomePageRepository {
//   Future<HomePageModel> fetchDetails(String email, String password);
// }

// class HomepageRepo extends HomePageRepository {
//   @override
//   Future<HomePageModel> fetchDetails(String email, String password) async {
//     Map<String, dynamic> request = {
//       'email': email,
//       'password': password,
//     };
//     final uri = Uri.parse("https://respos.menuclub.uk/api/loginApp/");
//     final response = await http.post(uri, body: request);

//     if (response.statusCode == 201) {
//       return HomePageModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load post');
//     }
//   }
// }

// // auth_state.dart
// import 'package:equatable/equatable.dart';

// class AuthState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class AuthInitial extends AuthState {}

// class AuthLoadingState extends AuthState {}

// class AuthErrorState extends AuthState {}

// // auth_event.dart
// import 'package:equatable/equatable.dart';

// class AuthEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class LoginEvent extends AuthEvent {
//   final String email;
//   final String password;

//   LoginEvent(this.email, this.password);

//   @override
//   List<Object?> get props => [email, password];
// }

// // auth_bloc.dart
// import 'dart:async';
// import 'package:app/logic/bloc/auth_event.dart';
// import 'package:app/logic/bloc/auth_state.dart';
// import 'package:app/models/model.dart';
// import 'package:bloc/bloc.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final HomePageRepository homePageRepo = HomepageRepo();

//   AuthBloc() : super(AuthInitial());

//   @override
//   Stream<AuthState> mapEventToState(AuthEvent event) async* {
//     if (event is LoginEvent) {
//       yield AuthLoadingState();
//       try {
//         HomePageModel data =
//             await homePageRepo.fetchDetails(event.email, event.password);
//         // Add logic to handle successful login
//         // For example, you can emit a state indicating success
//         // or navigate to the home page.
//       } catch (error) {
//         // Handle login error, for example, emit AuthErrorState
//         yield AuthErrorState();
//       }
//     }
//   }
// }
