import 'package:flutter/material.dart';
import 'package:movie_app/apps/helper/image_film.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/widgets/ratefilm_widget.dart';

class ReleasesList extends StatelessWidget {
  final List<Map<String, dynamic>> movies;
  const ReleasesList({super.key, required this.movies});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 7 / 10,
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
          final imageFilm = ImageFilm(poster_path: posterPath);
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
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
              },
            ),
            child: RatefilmWidget(
              image: imageFilm.getPosterUrl(),
              rating: double.parse(
                voteAverage.toStringAsFixed(1),
              ),
            ),
          );
        },
      ),
    );
  }
}
