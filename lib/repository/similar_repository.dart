import 'package:dio/dio.dart';
import 'package:movie_app/model/movie.dart';

class SimilarRepository {
  static Future<List<Movie>> fecthMovieSimilar(int id) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$id/similar?api_key=127d2a11a98ddebe6a6fd2d8dacfd1ce&language=en-US&page=1',
      );
      final List<dynamic> results = response.data['results'] as List<dynamic>;
      final movies = results.map((movieJson) {
        return Movie.fromMap(movieJson as Map<String, dynamic>);
      }).toList();
      return movies;
    } catch (e) {
      print('Error fetching movie details:::: $e');
      rethrow;
    }
  }
}
