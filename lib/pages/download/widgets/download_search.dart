import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/download/widgets/download_customsearch.dart';
import 'package:movie_app/provider/download_provider.dart';

class DownloadSearch extends SearchDelegate {
  final DownloadProvider provider;
  DownloadSearch({
    required this.provider,
  });
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: ColorApp.textColor,
        ),
        onPressed: () {
          query = '';
          provider.searchMovies(query);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: ColorApp.textColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero, () {
      provider.searchMovies(query);
    });
    return const DownloadCustomsearch();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Future.delayed(Duration.zero, () {
      provider.searchMovies(query);
    });
    return buildResults(context);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorApp.backgroundColor_dark,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xff9E9E9E),
        ),
        filled: true,
        fillColor: ColorApp.textColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: ColorApp.borderColor,
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
      ),
    );
  }
}
