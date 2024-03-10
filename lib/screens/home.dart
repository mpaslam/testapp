// success_page.dart
import 'package:app/models/model.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final LoginModel loginModel;

  SuccessPage(this.loginModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login successful!'),
            Text('User Token: ${loginModel.token}'),
            // Add more widgets to display other information if needed
          ],
        ),
      ),
    );
  }
}
