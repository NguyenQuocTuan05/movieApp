import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/apps/helper/flushbar_message.dart';
import 'package:movie_app/apps/helper/list_film.dart';
import 'package:movie_app/model/movie_popular.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/repository/moviedetails_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DownloadProvider extends ChangeNotifier {
  bool isWifiEnabled = true;
  void toggleWifi(bool value) {
    isWifiEnabled = value;
    notifyListeners();
  }

  List<int> ListIdMovie = [];
  List<int> filteredList = [];
  List<String> movieNames = [];
  List<String> moviePosters = [];
  List<String> movieDate = [];
  final FlushbarMessage _flushbar = FlushbarMessage();
  Future handleSaveList(int id, String name, String poster, String date,
      BuildContext context) async {
    if (ListIdMovie.contains(id)) {
      _flushbar.show(context, 'The movie "$name" is already saved!');
    } else {
      ListIdMovie.add(id);
      movieNames.add(name);
      moviePosters.add(poster);
      movieDate.add(date);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(ListFilm.keyListID, jsonEncode(ListIdMovie));
      await prefs.setString(ListFilm.keyListNames, jsonEncode(movieNames));
      await prefs.setString(ListFilm.keyListPosters, jsonEncode(moviePosters));
      await prefs.setString(ListFilm.keyListDate, jsonEncode(movieDate));
      _flushbar.show(context, 'The movie "$name" has been saved!');
      context
          .read<HomeProvider>()
          .addNotification('The movie "$name" has been saved!');
    }
    notifyListeners();
  }

  Future<void> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString(ListFilm.keyListID);
    final String? names = prefs.getString(ListFilm.keyListNames);
    final String? posters = prefs.getString(ListFilm.keyListPosters);
    final String? date = prefs.getString(ListFilm.keyListDate);
    List<int> results = List.from(await jsonDecode(action ?? '[]'));
    List<String> resultName = List.from(await jsonDecode(names ?? '[]'));
    List<String> resultPosters = List.from(await jsonDecode(posters ?? '[]'));
    List<String> resultDate = List.from(await jsonDecode(date ?? '[]'));
    movieNames = resultName;
    moviePosters = resultPosters;
    movieDate = resultDate;
    ListIdMovie = results;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<void> clearAllDownloads() async {
    ListIdMovie.clear();
    movieNames.clear();
    moviePosters.clear();
    movieDate.clear();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(ListFilm.keyListID);
    await prefs.remove(ListFilm.keyListNames);
    await prefs.remove(ListFilm.keyListPosters);
    await prefs.remove(ListFilm.keyListDate);
    notifyListeners();
  }

  Future<MoviePopular> fetchMovieWithId(int MovieId) async {
    return await MovieDetailsRepository().fetchMovieDetailsWithID(MovieId);
  }

  Future<void> deleteMovie(int id, BuildContext context) async {
    int index = ListIdMovie.indexOf(id);
    if (index != -1) {
      ListIdMovie.removeAt(index);
      movieDate.removeAt(index);
      movieNames.removeAt(index);
      moviePosters.removeAt(index);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(ListFilm.keyListID, jsonEncode(ListIdMovie));
      await prefs.setString(ListFilm.keyListNames, jsonEncode(movieNames));
      await prefs.setString(ListFilm.keyListPosters, jsonEncode(moviePosters));
      await prefs.setString(ListFilm.keyListDate, jsonEncode(movieDate));
      _flushbar.show(context, 'The movie has been removed!');
      notifyListeners();
    } else {
      _flushbar.show(context, 'Movie not found in the list!');
    }
  }

  void initializeList() {
    filteredList = ListIdMovie;
    notifyListeners();
  }

  void searchMovies(String query) async {
    if (query.isEmpty) {
      filteredList = ListIdMovie;
    } else {
      filteredList = ListIdMovie.where((movieId) {
        int index = ListIdMovie.indexOf(movieId);
        return movieNames[index].toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
