import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/helper/video_film.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/model/acting.dart';
import 'package:movie_app/model/video.dart';
import 'package:movie_app/pages/details/widgets/details_ekip.dart';
import 'package:movie_app/pages/details/widgets/details_film.dart';
import 'package:movie_app/pages/details/widgets/details_genre.dart';
import 'package:movie_app/pages/details/widgets/details_synopsis.dart';
import 'package:movie_app/pages/details/widgets/details_tab.dart';
import 'package:movie_app/pages/details/widgets/details_title.dart';
import 'package:movie_app/provider/details_provider.dart';
import 'package:movie_app/provider/download_provider.dart';
import 'package:movie_app/widgets/play_widgets.dart';
import 'package:movie_app/widgets/title_widgets.dart';
import 'package:provider/provider.dart';

class DetailsPages extends StatefulWidget {
  const DetailsPages({super.key});

  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      final id = args['id'];
      final detailsProvider = context.read<DetailsProvider>();
      detailsProvider.fetchActingMovie(id);
      detailsProvider.fetchVideoMovie(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final id = args['id'];
    final posterPath = args['poster_path'];
    final voteAverage = args['vote_average'];
    final genres = args['genres'];
    final overview = args['overview'];
    final title = args['title'] ?? args['name'] ?? 'Unknown Title';
    final release_date =
        args['release_date'] ?? args['first_air_date'] ?? 'Unknown Date';
    final original_language = args['original_language'];
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailsSynopsis(
              posterPath: posterPath ?? 'default_poster_path.jpg',
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  DetailsFilm(
                    names: title,
                    id: id,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DetailsTitle(
                      rating: voteAverage.toStringAsFixed(1),
                      year: release_date,
                      country: original_language,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: FutureBuilder<List<Video>>(
                          future: context.watch<DetailsProvider>().videoMovie,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return const Center(
                                child: Text(
                                  'No movies available.',
                                ),
                              );
                            }
                            final video = snapshot.data!.first;
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutersName.playPages,
                                  arguments: {
                                    'videoFilm': VideoFilm(id: video.key!),
                                    'name': title,
                                  },
                                );
                              },
                              child: const PlayWidgets(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: FutureBuilder<List<Video>>(
                          future: context.watch<DetailsProvider>().videoMovie,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return const Center(
                                child: Text('No videos available.'),
                              );
                            }
                            final video = snapshot.data!.first;
                            return Consumer<DownloadProvider>(
                              builder: (context, provider, child) {
                                return GestureDetector(
                                  onTap: () {
                                    provider.handleSaveList(
                                        id,
                                        title,
                                        video.key!,
                                        video.published_at!,
                                        context);
                                  },
                                  // onTap: () {
                                  //   provider.clearAllDownloads();
                                  // },
                                  child: const TitleWidgets(
                                    borderColor: ColorApp.platformColor,
                                    imagePath: 'assets/images/download.png',
                                    text: 'Download',
                                    textColor: ColorApp.platformColor,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DetailsGenre(
                    genres: genres,
                    overview: overview,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder<List<Acting>>(
                    future: context.watch<DetailsProvider>().actingMovie,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text(
                            'No actors available.',
                          ),
                        );
                      }
                      final actingList = snapshot.data!;
                      return DetailsEkip(
                        lenght: actingList.length,
                        actingList: actingList,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  DetailsTab(
                    id: id,
                  ),
                  const SizedBox(
                    height: 20,
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
