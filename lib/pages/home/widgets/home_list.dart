import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/rate.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/widgets/ratefilm_widget.dart';
import 'package:provider/provider.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  // final Future<List<dynamic>> future;
  // const HomeList({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      // future: Provider.of<HomeProvider>(context, listen: false).getRateMovies(),
      future:
          Provider.of<HomeProvider>(context, listen: false).getRateAndMovie(),
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
        final rates = snapshot.data!['rates'] as List<Rate>;
        final movies = snapshot.data!['movies'] as List<Movie>;

        return AspectRatio(
          aspectRatio: 2 / 1,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 8 / 10,
                child: RatefilmWidget(
                  rate: rates[index],
                  movie: movies[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
