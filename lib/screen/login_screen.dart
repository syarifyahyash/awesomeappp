import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:awesomeappp/screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> Login(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final response = await http.post(
      Uri.parse('https://api.unira.ac.id/v1/token'),
      headers: <String, String> {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final message = data['message'];
      final token = data['token'];
      print('Message: $message');
      print('Token: $token');
      print(response.body);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Success'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      print('Failed to login');
      print(response.body);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to login'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.green],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login SIMAT',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
                child: Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'NIM / NPM',
                    hintText: 'Enter your NIM / NPM',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'NIM / NPM is required';
                    }
                    if (int.tryParse(value) == null) {
                      return 'NIM / NPM must be a number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password / PIN',
                    hintText: 'Enter your password / PIN',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password / PIN is required';
                    }
                    return null;
                  },
                ),
              ],
            )),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: const Text('Login', style: TextStyle(fontSize: 20)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final username = _usernameController.text;
                  final password = _passwordController.text;
                  print('Username: $username');
                  // print('Password: $password');
                  
                  Login(context);

                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
