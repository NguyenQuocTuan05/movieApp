import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/apps/helper/flushbar_message.dart';
import 'package:movie_app/apps/helper/list_film.dart';
import 'package:movie_app/model/movie_popular.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/repository/moviedetails_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MylistProvider extends ChangeNotifier {
  List<int> ListIdMovie = [];
  List<int> filteredList = [];
  List<String> movieNames = [];
  final FlushbarMessage _flushbar = FlushbarMessage();
  Future handleSaveList(int id, String name, BuildContext context) async {
    if (ListIdMovie.contains(id)) {
      _flushbar.show(context, 'The movie "$name" is already saved!');
    } else {
      ListIdMovie.add(id);
      movieNames.add(name);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(ListFilm.keyListID, jsonEncode(ListIdMovie));
      await prefs.setString(ListFilm.keyListNames, jsonEncode(movieNames));
      _flushbar.show(context, 'The movie "$name" has been saved!');
    }
    notifyListeners();
    context
        .read<HomeProvider>()
        .addNotification('The movie "$name" has been saved!');
  }

  Future<void> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString(ListFilm.keyListID);
    final String? names = prefs.getString(ListFilm.keyListNames);
    List<int> results = List.from(await jsonDecode(action ?? '[]'));
    List<String> resultName = List.from(await jsonDecode(names ?? '[]'));
    movieNames = resultName;
    ListIdMovie = results;
    notifyListeners();
  }

  Future<MoviePopular> fetchMovieWithId(int MovieId) async {
    return await MovieDetailsRepository().fetchMovieDetailsWithID(MovieId);
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

  Future<void> removeMovieFromList(int id, BuildContext context) async {
    int index = ListIdMovie.indexOf(id);
    if (index != -1) {
      ListIdMovie.removeAt(index);
      movieNames.removeAt(index);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(ListFilm.keyListID, jsonEncode(ListIdMovie));
      await prefs.setString(ListFilm.keyListNames, jsonEncode(movieNames));
      _flushbar.show(context, 'The movie has been removed!');
      notifyListeners();
    } else {
      _flushbar.show(context, 'Movie not found in the list!');
    }
  }
}
