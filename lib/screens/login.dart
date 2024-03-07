// login.dart

import 'package:app/logic/bloc/auth_event.dart';
import 'package:app/models/api_call.dart';
import 'package:flutter/material.dart';
import 'package:app/logic/bloc/auth_bloc.dart';
//import 'package:app/api/api_call.dart'; // Import the necessary file

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final HomePageRepository homePageRepo = HomepageRepo(); // Instantiate the repository

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                fillColor: Colors.tealAccent,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                fillColor: Colors.tealAccent,
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                // Trigger login event
                AuthBloc(homePageRepo).add(LoginEvent(
                  _emailController.text,
                  _passwordController.text,
                ));
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Sign in with Google',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
