import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_popular.dart';
import 'package:movie_app/repository/search_repository.dart';

class SearchProvider extends ChangeNotifier {
  List<MoviePopular>? _movieSearches;
  List<MoviePopular>? get movieSearches => _movieSearches;
  bool isLoading = true;
  Future<List<MoviePopular>> fetchSearchMovie() async {
    _movieSearches = await SearchRepository.fetchTopSearchesWeek();
    notifyListeners();
    return _movieSearches!;
  }

  Future<List<MoviePopular>> fetchSearchMovieDetails(String query) async {
    return await SearchRepository.fetchsearchMovie(query);
  }

  Future<List<MoviePopular>> fetchDiscoverMovies(
      {required String category,
      String? with_original_language,
      String? genre,
      String? timePeriod,
      String? sort}) async {
    return await SearchRepository.fetchDiscoverMovies(
        category: category,
        with_original_language: with_original_language,
        genre: genre,
        timePeriod: timePeriod,
        sort: sort);
  }

  Map<String, List<String>> _selectedIndicesMap = {};
  List<String> getSelectedIndices(String key) {
    return _selectedIndicesMap[key] ?? [];
  }

  bool isSelected(String key, dynamic itemKey) {
    return _selectedIndicesMap[key]?.contains(itemKey) ?? false;
  }

  void toggleSelection(String key, String itemKey) {
    if (key == 'Genre') {
      if (_selectedIndicesMap[key] == null) {
        _selectedIndicesMap[key] = [];
      }
      if (_selectedIndicesMap[key]!.contains(itemKey)) {
        _selectedIndicesMap[key]!.remove(itemKey);
      } else {
        _selectedIndicesMap[key]!.add(itemKey);
      }
    } else {
      _selectedIndicesMap[key] = [itemKey];
    }
    notifyListeners();
  }

  void resetSelection() {
    _selectedIndicesMap.clear();
    notifyListeners();
  }

  void setSelectedIndices(Map<String, List<String>> selectedKeys) {
    _selectedIndicesMap = selectedKeys;
    notifyListeners();
  }

  Future<List<MoviePopular>> fetchDiscoverMoviesDetails(
      Map<String, List<String>> selectedIndices) async {
    print("Fetching discover movies with selected indices: $selectedIndices");
    final category = (selectedIndices['Categories']?.isNotEmpty ?? false)
        ? selectedIndices['Categories']!.first
        : 'movie';
    final with_original_language =
        (selectedIndices['with_original_language']?.isNotEmpty ?? false)
            ? selectedIndices['with_original_language']!.first
            : null;

    final genre = (selectedIndices['Genre']?.isNotEmpty ?? false)
        ? selectedIndices['Genre']!.join(',')
        : null;

    final timePeriod = (selectedIndices['Time/Periods']?.isNotEmpty ?? false)
        ? selectedIndices['Time/Periods']!.first
        : null;

    final sort = (selectedIndices['Sort']?.isNotEmpty ?? false)
        ? selectedIndices['Sort']!.first
        : null;

    return await SearchRepository.fetchDiscoverMovies(
      category: category,
      with_original_language: with_original_language,
      genre: genre,
      timePeriod: timePeriod,
      sort: sort,
    );
  }
}
