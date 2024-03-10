import 'package:app/logic/bloc/auth_bloc.dart';
import 'package:app/logic/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
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
            SizedBox(
              height: 20,
            ),
            BlocProvider(
              create: (BuildContext context) => UserLoginCubit(),
              child: BlocConsumer<UserLoginCubit, UserLoginState>(
                listener: (context, state) {
                  if (state is UserLoginLoaded) {
                    // Navigate to success page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessPage(),
                      ),
                    );
                  } else if (state is UserLoginError) {
                    // Show error message using ScaffoldMessenger
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login failed. Please try again.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        context.read<UserLoginCubit>().userLogin(
                              _emailController.text.toString(),
                              _passwordController.text.toString(),
                            );
                      });
                    },
                    child: state is UserLoginLoading
                        ? CircularProgressIndicator()
                        : Text('Login'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
      ),
      body: Center(
        child: Text('Login Successful!'),
      ),
    );
  }
}
