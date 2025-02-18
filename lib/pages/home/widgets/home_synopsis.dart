import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/helper/video_film.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/video.dart';
import 'package:movie_app/pages/search/search_pages.dart';
import 'package:movie_app/provider/details_provider.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/provider/mylist_provider.dart';
import 'package:movie_app/widgets/play_widgets.dart';
import 'package:movie_app/widgets/title_widgets.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeSynopsis extends StatefulWidget {
  const HomeSynopsis({super.key});

  @override
  State<HomeSynopsis> createState() => _HomeSynopsisState();
}

class _HomeSynopsisState extends State<HomeSynopsis> {
  late Future<List<Movie>> _futureMovies;

  @override
  void initState() {
    super.initState();
    _futureMovies = context.read<HomeProvider>().getMovieDetails();
    // Gọi fetchVideoMovie cho phim đầu tiên
    _futureMovies.then((movies) {
      if (movies.isNotEmpty) {
        context.read<DetailsProvider>().fetchVideoMovie(movies.first.id!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: _futureMovies,
      builder: (context, movieSnapshot) {
        if (movieSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (movieSnapshot.hasError) {
          return Center(child: Text('Error: ${movieSnapshot.error}'));
        } else if (!movieSnapshot.hasData || movieSnapshot.data!.isEmpty) {
          return const Center(child: Text('No movies available.'));
        }

        final movie = movieSnapshot.data!.first;
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
                      GestureDetector(
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: SearchPages(),
                          );
                        },
                        child: Image.asset(
                          'assets/images/search.png',
                          color: ColorApp.backgroundColor_dark,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Consumer<HomeProvider>(
                          builder: (context, provider, child) {
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutersName.bellPages);
                              },
                              child: Image.asset(
                                'assets/images/notification.png',
                                color: ColorApp.backgroundColor_dark,
                              ),
                            ),
                            if (provider.count > 0)
                              Positioned(
                                right: 1,
                                top: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: ColorApp.platformColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    provider.count.toString(),
                                    style: const TextStyle(
                                      color: ColorApp.textColor,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      })
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  movie.title ?? 'Unknown Title',
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
                Row(
                  children: [
                    Consumer<DetailsProvider>(
                      builder: (context, detailsProvider, child) {
                        final videos = detailsProvider.videoMovie;
                        if (videos == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return FutureBuilder<List<Video>>(
                          future: videos,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const PlayWidgets();
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return const Center(
                                  child: Text('No videos available.'));
                            }
                            final video = snapshot.data!.first;
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutersName.playPages,
                                  arguments: {
                                    'videoFilm': VideoFilm(id: video.key!),
                                    'name': movie.title,
                                  },
                                );
                              },
                              child: const PlayWidgets(),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(width: 20),
                    Consumer<MylistProvider>(
                      builder: (context, provider, child) {
                        return GestureDetector(
                          onTap: () {
                            provider.handleSaveList(
                                movie.id!, movie.title!, context);
                          },
                          child: const TitleWidgets(
                            borderColor: ColorApp.textColor,
                            imagePath: 'assets/images/plus.png',
                            text: 'My List',
                            textColor: ColorApp.textColor,
                          ),
                        );
                      },
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
