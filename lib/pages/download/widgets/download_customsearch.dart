import 'package:flutter/material.dart';
import 'package:movie_app/apps/helper/video_film.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/download/widgets/download_custom.dart';
import 'package:movie_app/pages/download/widgets/download_title.dart';
import 'package:movie_app/pages/search/widgets/search_error.dart';
import 'package:movie_app/provider/download_provider.dart';
import 'package:provider/provider.dart';

class DownloadCustomsearch extends StatelessWidget {
  const DownloadCustomsearch({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<DownloadProvider>(
      builder: (context, downloadProvider, child) {
        if (downloadProvider.ListIdMovie.isEmpty) {
          return const SearchError();
        }
        return Padding(
          padding: const EdgeInsets.all(24),
          child: ListView.separated(
            itemCount: downloadProvider.ListIdMovie.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 24);
            },
            itemBuilder: (BuildContext context, int index) {
              final movieName = downloadProvider.movieNames[index];
              final moviePosters = downloadProvider.moviePosters[index];
              final movieDate = downloadProvider.movieDate[index];
              final movieId = downloadProvider.ListIdMovie[index];
              return AspectRatio(
                aspectRatio: 3 / 1,
                child: DownloadCustom(
                  movieName: movieName,
                  moviePosters: moviePosters,
                  movieDate: movieDate,
                  movieId: movieId,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
