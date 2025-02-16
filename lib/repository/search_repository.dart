import 'package:dio/dio.dart';
import 'package:movie_app/model/movie_popular.dart';

class SearchRepository {
  static Future<List<MoviePopular>> fetchsearchMovie(String query) async {
    final dio = Dio();
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/search/movie?api_key=127d2a11a98ddebe6a6fd2d8dacfd1ce&query=$query&language=en-US&page=1');
      final results = response.data['results'] as List<dynamic>;
      return results.map((movieJson) {
        return MoviePopular.fromMap(movieJson as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error fetch search Movie :::: $e');
      rethrow;
    }
  }

  static Future<List<MoviePopular>> fetchPopularMovie() async {
    final dio = Dio();
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=127d2a11a98ddebe6a6fd2d8dacfd1ce&language=en-US&page=1');
      final result = response.data['results'] as List<dynamic>;
      final movies = result.map((movieJson) {
        return MoviePopular.fromMap(movieJson as Map<String, dynamic>);
      }).toList();
      return movies;
    } catch (e) {
      print('Error fetch popular movie :::: $e');
      rethrow;
    }
  }

  static Future<List<MoviePopular>> fetchTopSearchesWeek() async {
    final dio = Dio();
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/trending/movie/week?api_key=127d2a11a98ddebe6a6fd2d8dacfd1ce&language=en-US&page=1');
      final result = response.data['results'] as List<dynamic>;
      final movies = result.map((movieJson) {
        return MoviePopular.fromMap(movieJson as Map<String, dynamic>);
      }).toList();
      return movies;
    } catch (e) {
      print('Error fetch popular movie :::: $e');
      rethrow;
    }
  }

  static Future<List<MoviePopular>> fetchDiscoverMovies({
    required String category,
    String? with_original_language,
    String? genre,
    String? timePeriod,
    String? sort,
  }) async {
    if (category != 'movie' && category != 'tv') {
      throw Exception('Category must be "movie" or "tv"');
    }

    final dio = Dio();
    try {
      String url =
          'https://api.themoviedb.org/3/discover/$category?api_key=127d2a11a98ddebe6a6fd2d8dacfd1ce&language=en-US&page=1';
      if (with_original_language != null && with_original_language.isNotEmpty) {
        url +=
            '&with_original_language=${Uri.encodeComponent(with_original_language)}';
      }
      if (genre != null && genre.isNotEmpty) {
        url += '&with_genres=${Uri.encodeComponent(genre)}';
      }
      if (timePeriod != null && timePeriod.isNotEmpty) {
        url += '&primary_release_year=${Uri.encodeComponent(timePeriod)}';
      }
      if (sort != null && sort.isNotEmpty) {
        url += '&sort_by=${Uri.encodeComponent(sort)}';
      }
      print('API URL: $url');

      final response = await dio.get(url);
      final result = response.data['results'] as List<dynamic>;
      final movies = result.map((movieJson) {
        return MoviePopular.fromMap(movieJson as Map<String, dynamic>);
      }).toList();
      return movies;
    } catch (e) {
      print('Error fetching discover movies:::: $e');
      rethrow;
    }
  }
}
