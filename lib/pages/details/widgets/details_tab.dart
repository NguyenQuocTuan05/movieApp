import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/video.dart';
import 'package:movie_app/pages/details/widgets/details_list.dart';
import 'package:movie_app/pages/details/widgets/details_trailers.dart';
import 'package:movie_app/provider/details_provider.dart';
import 'package:provider/provider.dart';

class DetailsTab extends StatefulWidget {
  const DetailsTab({
    super.key,
    required this.id,
  });
  final int id;
  @override
  State<DetailsTab> createState() => _DetailsTabState();
}

class _DetailsTabState extends State<DetailsTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState

    _tabController = TabController(length: 2, vsync: this);
    Future.microtask(() {
      context.read<DetailsProvider>().fetchMovieSilimar(widget.id);
    });
  }

  @override
  void dispose()
  // TODO: implement dispose

  {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelStyle: const TextStyle(fontSize: 16),
          controller: _tabController,
          labelColor: ColorApp.platformColor,
          unselectedLabelColor: ColorApp.borderColor,
          indicator: UnderlineTabIndicator(
            borderSide: const BorderSide(
              color: ColorApp.platformColor,
              width: 2,
            ),
            insets: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 6,
            ),
          ),
          tabs: const [
            Tab(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text("Trailers"),
              ),
            ),
            Tab(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text("More Like This"),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: TabBarView(
            controller: _tabController,
            children: [
              FutureBuilder(
                future: context.watch<DetailsProvider>().videoMovie,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'No movies available.',
                      ),
                    );
                  }
                  final video = snapshot.data as List<Video>;
                  return DetailsTrailers(
                    video: video,
                  );
                },
              ),
              FutureBuilder(
                future: context.watch<DetailsProvider>().similarMovie,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                  final movies = snapshot.data! as List<Movie>;
                  final movieList = movies.map<Map<String, dynamic>>((movie) {
                    return {
                      'poster_path': movie.poster_path,
                      'vote_average': movie.vote_average,
                      'title': movie.title,
                      'genres': movie.getGenresAsString(),
                      'overview': movie.overview,
                      'release_date': movie.release_date,
                      'original_language': movie.getOriginalLanguageFull(),
                      'id': movie.id,
                    };
                  }).toList();
                  return DetailsList(movies: movieList);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
