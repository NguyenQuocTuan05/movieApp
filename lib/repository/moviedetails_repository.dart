import 'package:dio/dio.dart';
import 'package:movie_app/model/acting.dart';
import 'package:movie_app/model/movie_popular.dart';

class MovieDetailsRepository {
  Future<List<Acting>> fetchActingMovie(int ActingId) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$ActingId/credits?api_key=127d2a11a98ddebe6a6fd2d8dacfd1ce',
      );
      final castData = response.data['cast'] as List<dynamic>;
      return castData
          .map((json) => Acting.fromMap(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching acting movie details:::: $e");
      rethrow;
    }
  }

  Future<MoviePopular> fetchMovieDetailsWithID(int MovieId) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$MovieId?api_key=127d2a11a98ddebe6a6fd2d8dacfd1ce&language=en-US',
      );
      final movieData = response.data as Map<String, dynamic>;
      return MoviePopular.fromMap(movieData);
    } catch (e) {
      print("Error fetching acting movie details:::: $e");
      rethrow;
    }
  }
}
