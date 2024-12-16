import 'package:awesomeappp/screen/about_screen.dart';
import 'package:awesomeappp/service/movie.dart';
import 'package:flutter/material.dart';
import 'package:awesomeappp/screen/detail_screen.dart';
import 'package:awesomeappp/screen/camera_screen.dart';
// import 'package:awesomeappp/screen/home_screen.dart';
// import 'package:awesomeappp/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome App Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      onGenerateRoute: (settings){
        if (settings.name == '/'){
          // return MaterialPageRoute(builder: (context) => const LoginScreen());
          // return MaterialPageRoute(builder: (context) => const HomeScreen());
          return MaterialPageRoute(builder: (context) => const CameraScreen());
        }
        if (settings.name == '/detail'){
          final movie = settings.arguments as Movie;
          return MaterialPageRoute(builder: (context) => DetailScreen(movie: movie,));
        }
        if (settings.name == '/about'){
          return MaterialPageRoute(builder: (context) => const AboutScreen());
        }
        return null;
      },
    );
  }
}

