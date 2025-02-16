import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/helper/image_film.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/model/movie_popular.dart';
import 'package:movie_app/pages/search/widgets/search_error.dart';
import 'package:movie_app/provider/mylist_provider.dart';
import 'package:movie_app/widgets/ratefilm_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MylistSearch extends SearchDelegate {
  final MylistProvider provider;
  MylistSearch({
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
          provider.searchMovies('');
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
    return Consumer<MylistProvider>(
      builder: (context, provider, child) {
        if (provider.filteredList.isEmpty) {
          return const SearchError();
        }
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 8 / 10,
            ),
            itemCount: provider.filteredList.length,
            itemBuilder: (BuildContext context, int index) {
              final movieId = provider.filteredList[index];
              return FutureBuilder<MoviePopular>(
                future: provider.fetchMovieWithId(movieId),
                builder: (BuildContext context,
                    AsyncSnapshot<MoviePopular> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text('No movies available.'),
                    );
                  }
                  final movie = snapshot.data!;
                  final imageFilm = ImageFilm(poster_path: movie.poster_path!);
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      RoutersName.detailsPages,
                      arguments: {
                        'poster_path': movie.poster_path,
                        'vote_average': movie.vote_average,
                        'title': movie.title,
                        'genres': movie.genres
                                ?.map((genre) => genre.name)
                                .join(', ') ??
                            'No genres',
                        'overview': movie.overview,
                        'release_date': movie.release_date,
                        'original_language': movie.getOriginalLanguageFull(),
                        'id': movie.id,
                      },
                    ),
                    child: RatefilmWidget(
                      image: imageFilm.getPosterUrl(),
                      rating: double.parse(
                        movie.vote_average!.toStringAsFixed(1),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
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
