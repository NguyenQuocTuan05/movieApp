import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/helper/video_film.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/download/widgets/download_delete.dart';
import 'package:movie_app/pages/download/widgets/download_title.dart';

class DownloadCustom extends StatelessWidget {
  const DownloadCustom({
    super.key,
    required this.movieName,
    required this.moviePosters,
    required this.movieDate,
    required this.movieId,
  });
  final String moviePosters;
  final String movieName;
  final String movieDate;
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                RoutersName.playPages,
                arguments: {
                  'name': movieName,
                  'videoFilm': VideoFilm(
                    id: moviePosters,
                  ),
                },
              );
            },
            child: DownloadTitle(
              movieDate: movieDate,
              movieName: movieName,
              moviePosters: moviePosters,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                context: context,
                builder: (context) {
                  return DownloadDelete(
                    movieDate: movieDate,
                    movieName: movieName,
                    moviePosters: moviePosters,
                    movieId: movieId,
                  );
                });
          },
          child: Image.asset(
            'assets/images/delete.png',
            color: ColorApp.platformColor,
          ),
        ),
      ],
    );
  }
}
