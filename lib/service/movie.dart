import 'dart:convert';
import 'package:http/http.dart' as http;

class Movie{
  final int id;
  final String title;
  final String overview;
  final String poster_path;
  
  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.poster_path,
  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      poster_path: json['poster_path'],
    );
  }
}

  class MovieService {
    final String apiKey = 'c9cee8f81124da363f510413e54c7f36';
    final String baseUrl = 'https://api.themoviedb.org/3';

    Future<List<Movie>> getPopularMovies() async {
      final response = await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

      if(response.statusCode == 200){
        final List<dynamic> result = jsonDecode(response.body)['results'];
        return result.map((e) => Movie.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    }

  }

