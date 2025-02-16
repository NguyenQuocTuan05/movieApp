import 'package:flutter/material.dart';
import 'package:movie_app/apps/helper/image_film.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/widgets/ratefilm_widget.dart';

class HomeList extends StatelessWidget {
  final List<Map<String, dynamic>> movies;
  const HomeList({
    super.key,
    required this.movies,
  });
  @override
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          final posterPath = movie['poster_path'];
          final voteAverage = movie['vote_average'];
          final imageFilm = ImageFilm(poster_path: posterPath);
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                RoutersName.detailsPages,
                arguments: movie,
              );
            },
            child: AspectRatio(
              aspectRatio: 8 / 10,
              child: RatefilmWidget(
                image: imageFilm.getPosterUrl(),
                rating: double.parse(
                  voteAverage.toStringAsFixed(1),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
