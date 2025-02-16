import 'package:flutter/material.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/rate.dart';
import 'package:movie_app/pages/home/widgets/home_list.dart';
import 'package:movie_app/pages/home/widgets/home_synopsis.dart';
import 'package:movie_app/pages/home/widgets/home_title.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeSynopsis(),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  HomeTitle(
                    title: 'Top 10 Movies This Week',
                    onTap: () {
                      Navigator.pushNamed(context, RoutersName.topPages);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  FutureBuilder(
                    future: Provider.of<HomeProvider>(context, listen: false)
                        .getMovieDetails(),
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
                      final movies = snapshot.data! as List<Movie>;
                      final movieList =
                          movies.map<Map<String, dynamic>>((movie) {
                        return {
                          'poster_path': movie.poster_path,
                          'vote_average': movie.vote_average,
                          'title': movie.title,
                          'genres': movie.getGenresAsString(),
                          'overview': movie.overview,
                          'release_date': movie.release_date,
                          'original_language': movie.getOriginalLanguageFull(),
                          'id': movie.id,
                        };
                      }).toList();

                      return HomeList(movies: movieList);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HomeTitle(
                    title: 'New Releases',
                    onTap: () {
                      Navigator.pushNamed(context, RoutersName.releasesPages);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  FutureBuilder(
                    future: Provider.of<HomeProvider>(context, listen: false)
                        .getRateMovies(),
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
                      final movies = snapshot.data! as List<Rate>;
                      final movieList =
                          movies.map<Map<String, dynamic>>((movie) {
                        return {
                          'poster_path': movie.poster_path,
                          'vote_average': movie.vote_average,
                          'title': movie.title,
                          'genres': movie.getGenresAsString(),
                          'overview': movie.overview,
                          'release_date': movie.release_date,
                          'original_language': movie.getOriginalLanguageFull(),
                          'id': movie.id,
                        };
                      }).toList();
                      return HomeList(
                        movies: movieList,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
