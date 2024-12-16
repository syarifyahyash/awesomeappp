import 'package:flutter/material.dart';
import 'package:awesomeappp/service/movie.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.poster_path}',
                width: 200,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.overview,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      )
    );
  }
}