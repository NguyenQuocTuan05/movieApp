import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/helper/image_film.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/model/movie_popular.dart';
import 'package:movie_app/pages/search/widgets/search_error.dart';
import 'package:movie_app/provider/search_provider.dart';
import 'package:movie_app/widgets/ratefilm_widget.dart';
import 'package:provider/provider.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
    this.query,
    this.selectedIndices,
  });
  final String? query;
  final Map<String, List<String>>? selectedIndices;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FutureBuilder(
        future: context.read<SearchProvider>().fetchSearchMovieDetails(query!),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(
                  color: ColorApp.textColor,
                ),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'No data returned.',
                style: TextStyle(
                  color: ColorApp.textColor,
                ),
              ),
            );
          } else if (snapshot.data!.isEmpty) {
            return const SearchError();
          }
          final movies = snapshot.data! as List<MoviePopular>;
          final validMovies = movies
              .where((movie) =>
                  movie.poster_path != null &&
                  movie.poster_path != '' &&
                  movie.poster_path != 'default_poster_path.jpg')
              .toList();
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 8 / 10,
            ),
            itemCount: validMovies.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = validMovies[index];
              final posterPath = movie.poster_path ?? 'default_poster_path.jpg';
              final voteAverage = movie.vote_average!;
              final imageFilm = ImageFilm(poster_path: posterPath);
              final movieDetails = {
                'poster_path': movie.poster_path,
                'vote_average': movie.vote_average,
                'title': movie.title,
                'genres': movie.getGenresAsString(),
                'overview': movie.overview,
                'release_date': movie.release_date,
                'original_language': movie.getOriginalLanguageFull(),
                'id': movie.id,
              };
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutersName.detailsPages,
                    arguments: movieDetails,
                  );
                },
                child: RatefilmWidget(
                  image: imageFilm.getPosterUrl(),
                  rating: double.parse(
                    voteAverage.toStringAsFixed(1),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
