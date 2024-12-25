import 'package:dio/dio.dart';
import 'package:movie_app/model/rate.dart';

class TopRepository {
  static Future fetchRateMovies() async {
    final dio = Dio();
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/tv/top_rated?api_key=127d2a11a98ddebe6a6fd2d8dacfd1ce&language=en-US&page=1');
      final List<dynamic> result = response.data['results'] as List<dynamic>;
      final movies = result.map((movieJson) {
        return Rate.fromMap(movieJson as Map<String, dynamic>);
      }).toList();
      return movies;
    } catch (e) {
      print('fetchRateMovies :::: $e');
      rethrow;
    }
  }
}
