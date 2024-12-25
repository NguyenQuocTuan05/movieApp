import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:movie_app/model/movie.dart';

class HomeRepository {
  static Future<List<Movie>?> fetchMovieDetails() async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=127d2a11a98ddebe6a6fd2d8dacfd1ce&language=en-US&page=1',
      );
      final List<dynamic> results = response.data['results'] as List<dynamic>;
      final movies = results.map((movieJson) {
        return Movie.fromMap(movieJson as Map<String, dynamic>);
      }).toList();
      return movies;
    } catch (e) {
      print('Error fetching movie details:::: $e');
      return null;
    }
  }
}
