import 'package:flutter/material.dart';
import 'package:movie_app/model/acting.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/video.dart';
import 'package:movie_app/repository/moviedetails_repository.dart';
import 'package:movie_app/repository/similar_repository.dart';
import 'package:movie_app/repository/video_repository.dart';

class DetailsProvider extends ChangeNotifier {
  final MovieDetailsRepository _movieDetailsRepository =
      MovieDetailsRepository();
  Future<List<Acting>>? _actingMovieFuture;
  Future<List<Acting>>? get actingMovie => _actingMovieFuture;
  final VideoRepository _videoRepository = VideoRepository();
  Future<List<Video>>? _videoMovieFuture;
  Future<List<Video>>? get videoMovie => _videoMovieFuture;
  Future<List<Movie>>? _similarMovie;
  Future<List<Movie>>? get similarMovie => _similarMovie;
  Future<void> fetchActingMovie(int actingId) async {
    try {
      _actingMovieFuture = _movieDetailsRepository.fetchActingMovie(actingId);
      notifyListeners();
    } catch (e) {
      print("Error in DetailsProvider:::::: $e");
      rethrow;
    }
  }

  Future<void> fetchMovieSilimar(int actingId) async {
    try {
      _similarMovie = SimilarRepository.fecthMovieSimilar(actingId);
      notifyListeners();
    } catch (e) {
      print("Error in DetailsProvider:::::: $e");
      rethrow;
    }
  }

  Future<List<Video>> fetchVideoMovie(int actingId) async {
    try {
      _videoMovieFuture = _videoRepository.fetchVideoMovie(actingId);
      return _videoMovieFuture!;
    } catch (e) {
      print("Error in DetailsProvider:::::: $e");
      rethrow;
    }
  }

  Future<void> fetchVideoTVShows(int actingId) async {
    try {
      _videoMovieFuture = _videoRepository.fetchVideoTVShows(actingId);
      notifyListeners();
    } catch (e) {
      print("Error in DetailsProvider:::::: $e");
      rethrow;
    }
  }

  Future<void> fetchVideoByCategory(int actingId, String category) async {
    try {
      if (category == 'movie') {
        await fetchVideoMovie(actingId);
      } else if (category == 'tv') {
        await fetchVideoTVShows(actingId);
      } else {
        throw Exception("Invalid category: $category");
      }
    } catch (e) {
      print("Error in fetchVideoByCategory:::::: $e");
      rethrow;
    }
  }
}
