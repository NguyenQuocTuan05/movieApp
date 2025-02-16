import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/download/widgets/download_title.dart';
import 'package:movie_app/pages/search/widgets/search_line.dart';
import 'package:movie_app/provider/download_provider.dart';
import 'package:movie_app/widgets/both_button.dart';
import 'package:provider/provider.dart';

class DownloadDelete extends StatelessWidget {
  const DownloadDelete({
    super.key,
    required this.movieDate,
    required this.movieName,
    required this.moviePosters,
    required this.movieId,
  });

  final String moviePosters;
  final String movieName;
  final String movieDate;
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Delete',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorApp.platformColor,
              ),
            ),
            const SizedBox(height: 24),
            const SearchLine(),
            const SizedBox(height: 24),
            Text(
              'Are you sure you want to delete this \nmovie download?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            AspectRatio(
              aspectRatio: 3 / 1,
              child: DownloadTitle(
                  movieDate: movieDate,
                  movieName: movieName,
                  moviePosters: moviePosters),
            ),
            const SizedBox(
              height: 24,
            ),
            Consumer<DownloadProvider>(
              builder: (context, provider, child) {
                return BothButton(
                  textFirst: 'Cancel',
                  textSecond: 'Yes, Delete',
                  onTapFirst: () => Navigator.pop(context),
                  onTapSecond: () {
                    provider.deleteMovie(movieId, context);
                    Navigator.pop(context);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
