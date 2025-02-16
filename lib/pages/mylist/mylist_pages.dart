import 'package:flutter/material.dart';
import 'package:movie_app/apps/helper/image_film.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/model/movie_popular.dart';
import 'package:movie_app/pages/mylist/widgets/mylist_delete.dart';
import 'package:movie_app/pages/mylist/widgets/mylist_empty.dart';
import 'package:movie_app/pages/mylist/widgets/mylist_search.dart';
import 'package:movie_app/provider/mylist_provider.dart';
import 'package:movie_app/widgets/appbar_widgets.dart';
import 'package:movie_app/widgets/ratefilm_widget.dart';
import 'package:provider/provider.dart';

class MylistPages extends StatelessWidget {
  const MylistPages({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<MylistProvider>();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppbarWidgets(
        title: 'My List',
        onTap: () {
          showSearch(
            context: context,
            delegate: MylistSearch(
              provider: provider,
            ),
          );
        },
      ),
      body: Consumer<MylistProvider>(
        builder: (context, provider, child) {
          if (provider.ListIdMovie.isEmpty) {
            return const MylistEmpty();
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 8 / 10,
            ),
            itemCount: provider.ListIdMovie.length,
            itemBuilder: (BuildContext context, int index) {
              final movieId = provider.ListIdMovie[index];
              return FutureBuilder<MoviePopular>(
                future: provider.fetchMovieWithId(movieId),
                builder: (BuildContext context,
                    AsyncSnapshot<MoviePopular> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
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
                    onLongPress: () {
                      showModalBottomSheet(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          context: context,
                          builder: (context) {
                            return MylistDelete(movieId: movieId);
                          });
                    },
                    onTap: () {
                      Navigator.pushNamed(
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
                          'original_language': movie.getOriginalLanguageFull(),
                          'release_date': movie.release_date,
                          'id': movie.id,
                        },
                      );
                    },
                    child: RatefilmWidget(
                      image: imageFilm.getPosterUrl(),
                      rating:
                          double.parse(movie.vote_average!.toStringAsFixed(1)),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
