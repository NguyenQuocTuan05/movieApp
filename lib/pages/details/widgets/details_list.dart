import 'package:flutter/material.dart';
import 'package:movie_app/apps/helper/image_film.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/widgets/ratefilm_widget.dart';

class DetailsList extends StatelessWidget {
  const DetailsList({super.key, required this.movies});
  final List<Map<String, dynamic>> movies;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 7 / 10,
      ),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        final movie = movies[index];
        final posterPath = movie['poster_path'] ?? '';
        final voteAverage = (movie['vote_average'] as num?)?.toDouble() ?? 0.0;
        final title = movie['title'] ?? 'Unknown Title';
        final genres = movie['genres'] ?? [];
        final overview = movie['overview'] ?? 'No Overview Available';
        final original_language = movie['original_language'] ?? 'Unknown';
        final release_date = movie['release_date'] ?? 'Unknown Date';
        final id = movie['id'] ?? 0;
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
    );
  }
}
