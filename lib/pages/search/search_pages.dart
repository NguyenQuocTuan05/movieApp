// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/search/widgets/search_results.dart';
import 'package:movie_app/pages/search/widgets/search_sort_filter.dart';
import 'package:movie_app/pages/search/widgets/search_suggestions.dart';

class SearchPages extends SearchDelegate {
  final Map<String, List<String>>? selectedIndices;
  SearchPages({
    this.selectedIndices,
  });
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      const SearchSortFilter(),
      const SizedBox(
        width: 15,
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: ColorApp.textColor,
      ),
      onPressed: () {
        FocusScope.of(context).unfocus();
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const SearchSuggestions();
    } else {
      return SearchResults(
        query: query,
      );
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResults(
      query: query,
    );
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
