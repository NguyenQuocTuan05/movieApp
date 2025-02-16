import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_popular.dart';
import 'package:movie_app/repository/search_repository.dart';

class ExploreProvider extends ChangeNotifier {
  List<MoviePopular>? _moviePopular;
  List<MoviePopular>? get moviePopular => _moviePopular;
  Future<List<MoviePopular>> getMovieDetails() async {
    _moviePopular = await SearchRepository.fetchPopularMovie();
    notifyListeners();
    return _moviePopular!;
  }
}
