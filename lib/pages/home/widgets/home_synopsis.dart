import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/widgets/play_widgets.dart';
import 'package:movie_app/widgets/title_widgets.dart';
import 'package:provider/provider.dart';

class HomeSynopsis extends StatefulWidget {
  const HomeSynopsis({super.key});

  @override
  State<HomeSynopsis> createState() => _HomeSynopsisState();
}

class _HomeSynopsisState extends State<HomeSynopsis> {
  late Future<List<Movie>> _future;

  @override
  void initState() {
    super.initState();
    _future =
        Provider.of<HomeProvider>(context, listen: false).getMovieDetails();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: _future,
      builder: (context, snapshot) {
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
        final movie = snapshot.data!.first;

        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(movie.getPosterUrl()),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 10 / 1,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 40,
                      ),
                      const Spacer(),
                      Image.asset('assets/images/search.png'),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/notification.png',
                        height: 40,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  movie.original_title ?? 'Unknown Title',
                  style: const TextStyle(
                    fontSize: 24,
                    color: ColorApp.textColor,
                  ),
                ),
                Text(
                  movie.getGenresAsString(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorApp.textColor,
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    PlayWidgets(),
                    SizedBox(width: 20),
                    TitleWidgets(
                      borderColor: ColorApp.textColor,
                      imagePath: 'assets/images/plus.png',
                      text: 'My List',
                      textColor: ColorApp.textColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
