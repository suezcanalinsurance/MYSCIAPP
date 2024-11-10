import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:suezproduction/linkapi.dart';



class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();
  String _biometricData = "";
  bool _authenticated = false;

  Future<void> _authenticate() async {
    try {
      _authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> _registerUser() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      _showDialog('Error', 'Username and password are required.');
      return;
    }

    await _authenticate();

    if (_biometricData.isEmpty) {
      _showDialog('Error', 'Biometric authentication failed.');
      return;
    }

    try {
      String result = await registerUserWithBiometric(username, password, _biometricData);
      _showDialog('Register User', result);
    } catch (error) {
      _showDialog('Error', 'Failed to register user: $error');
    }
  }

  Future<String> registerUserWithBiometric(String username, String password, String biometricData) async {
    String url = AppLink.sign_up;
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, String> body = {
      'username': username,
      'password': password,
      'email': biometricData,

      "mobile":"45454"
    };

    final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));

    if (response.statusCode == 201) {
      return 'User registered successfully';
    } else {
      throw Exception('Failed to register user.');
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerUser,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
