import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/rate.dart';
import 'package:movie_app/repository/home_repository.dart';
import 'package:movie_app/repository/top_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  List<Movie>? _movies;
  List<Movie>? get movies => _movies;

  String? _countryName;
  String? get countryName => _countryName;
  int count = 0;
  List<String> _notifications = [];
  List<String> get notifications => _notifications;

  Future<List<Movie>> getMovieDetails() async {
    _movies = await HomeRepository.fetchMovieDetails();
    notifyListeners();
    return _movies!;
  }

  HomeProvider() {
    _loadNotificationCount();
  }

  Future<void> _loadNotificationCount() async {
    final prefs = await SharedPreferences.getInstance();
    count = prefs.getInt('notification_count') ?? 0;
    _notifications = prefs.getStringList('notifications') ?? [];
    notifyListeners();
  }

  Future<void> _saveNotificationCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('notification_count', count);
    await prefs.setStringList('notifications', _notifications);
  }

  List<Rate>? _rate;
  List<Rate>? get rate => _rate;

  Future<List<Rate>> getRateMovies() async {
    _rate = await TopRepository.fetchRateMovies();
    notifyListeners();
    return _rate!;
  }

  void addNotification(String message) {
    count++;
    _saveNotificationCount();
    _notifications.add(message);
    notifyListeners();
  }

  void clearNotifications() {
    count = 0;
    _saveNotificationCount();
    _notifications.clear();
    notifyListeners();
  }

  void removeNotification(int index) {
    if (index >= 0 && index < _notifications.length) {
      _notifications.removeAt(index);
      count--;
      _saveNotificationCount();
      notifyListeners();
    }
  }
}
