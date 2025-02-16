import 'package:flutter/material.dart';
import 'package:movie_app/apps/helper/image_film.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/widgets/ratefilm_widget.dart';

class ExploreList extends StatelessWidget {
  const ExploreList({
    super.key,
    required this.movies,
  });
  final List<Map<String, dynamic>> movies;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 8 / 10,
      ),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        final movie = movies[index];
        final posterPath = movie['poster_path'];
        final voteAverage = movie['vote_average'];
        final title = movie['title'];
        final genres = movie['genres'];
        final overview = movie['overview'];
        final original_language = movie['original_language'];
        final release_date = movie['release_date'];
        final id = movie['id'];
        final name = movie['name'];
        final first_air_date = movie['first_air_date'];
        final imageFilm = ImageFilm(poster_path: posterPath);
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              RoutersName.detailsPages,
              arguments: {
                'poster_path': posterPath,
                'vote_average': voteAverage,
                'title': title,
                'genres': genres,
                'overview': overview,
                'original_language': original_language,
                'release_date': release_date,
                'id': id,
                'name': name,
                'first_air_date': first_air_date
              },
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
  }
}
