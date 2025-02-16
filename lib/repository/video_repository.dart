import 'package:dio/dio.dart';
import 'package:movie_app/model/video.dart';

class VideoRepository {
  Future<List<Video>> fetchVideoMovie(int movieId) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=127d2a11a98ddebe6a6fd2d8dacfd1ce&language=en-US',
      );
      final List<Video> videos = (response.data['results'] as List<dynamic>)
          .map((json) => Video.fromMap(json as Map<String, dynamic>))
          .toList();
      return videos;
    } catch (e) {
      print("Error fetching video movie details:::: $e");
      rethrow;
    }
  }

  Future<List<Video>> fetchVideoTVShows(int movieId) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/tv/$movieId/videos?api_key=127d2a11a98ddebe6a6fd2d8dacfd1ce&language=en-US',
      );
      final List<Video> videos = (response.data['results'] as List<dynamic>)
          .map((json) => Video.fromMap(json as Map<String, dynamic>))
          .toList();
      return videos;
    } catch (e) {
      print("Error fetching video tvShows details:::: $e");
      rethrow;
    }
  }
}
