import 'package:flutter/material.dart';

class Myhomepage extends StatelessWidget {
  const Myhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(children: [
        const Text(
          'Welcome Mobile Apps Labet',
          style: TextStyle(
            fontFamily: 'Poppins', // Menggunakan font Poppins
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        Image.asset(
          '/images/3.png',
          width: 160,
        ),
      ]),
    ));
  }
}
