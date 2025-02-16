import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_popular.dart';
import 'package:movie_app/pages/explore/widgets/explore_list.dart';
import 'package:movie_app/provider/explore_provider.dart';
import 'package:movie_app/provider/search_provider.dart';
import 'package:provider/provider.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({
    super.key,
    this.isDiscover = false,
    this.selectedIndices,
  });
  final bool isDiscover;
  final Map<String, List<String>>? selectedIndices;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final isDiscover =
        (args as Map<String, dynamic>?)?['isDiscover'] as bool? ?? false;
    final selectedIndices =
        (args)?['selectedIndices'] as Map<String, List<String>>?;
    print(selectedIndices);
    return FutureBuilder(
      future: isDiscover
          ? context
              .read<SearchProvider>()
              .fetchDiscoverMoviesDetails(selectedIndices!)
          : context.read<ExploreProvider>().getMovieDetails(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No movies available.'),
          );
        }
        final movies = snapshot.data! as List<MoviePopular>;
        final movieList = movies.map<Map<String, dynamic>>((movie) {
          return {
            'poster_path': movie.poster_path,
            'vote_average': movie.vote_average,
            'title': movie.title,
            'genres': movie.getGenresAsString(),
            'overview': movie.overview,
            'release_date': movie.release_date,
            'original_language': movie.getOriginalLanguageFull(),
            'id': movie.id,
            'first_air_date': movie.first_air_date,
            'name': movie.name,
          };
        }).toList();
        return ExploreList(
          movies: movieList,
        );
      },
    );
  }
}
