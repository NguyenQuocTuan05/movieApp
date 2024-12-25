import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/rate.dart';
import 'package:movie_app/repository/home_repository.dart';
import 'package:movie_app/repository/top_repository.dart';

class HomeProvider extends ChangeNotifier {
  // final HomeRepository _homeRepository = HomeRepository();
  List<Movie>? _movies;
  List<Movie>? get movies => _movies;
  List<Movie>? _newReleases;
  List<Movie>? get newReleases => _newReleases;
  Future<List<Movie>> getMovieDetails() async {
    _movies = await HomeRepository.fetchMovieDetails();
    notifyListeners();
    return _movies!;
  }

  Future<List<Movie>> getNewReleases() async {
    _newReleases = await HomeRepository.fetchMovieDetails();
    notifyListeners();
    return _newReleases!;
  }

  Future<Map<String, dynamic>> getRateAndMovie() async {
    final rates = await getRateMovies();
    final movies = await getNewReleases();
    return {'rates': rates, 'movies': movies};
  }

  List<Rate>? _rate;
  List<Rate>? get rate => _rate;
  Future<List<Rate>> getRateMovies() async {
    _rate = await TopRepository.fetchRateMovies();
    notifyListeners();
    return _rate!;
  }
}
