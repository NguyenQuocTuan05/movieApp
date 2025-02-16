import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/search/search_pages.dart';
import 'package:movie_app/pages/top/widgets/top_list.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class TopPages extends StatelessWidget {
  const TopPages({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyLarge?.color,
            size: 28,
          ),
        ),
        title: Text(
          'Top 10 Movies This Week',
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: SearchPages(),
              );
            },
            child: Image.asset(
              'assets/images/search.png',
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: context.read<HomeProvider>().getMovieDetails(),
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
                return TopList(movies: movieList);
              },
            ),
          ),
        ],
      ),
    );
  }
}
