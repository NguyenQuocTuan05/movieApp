import 'package:flutter/material.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/widgets/ratefilm_widget.dart';
import 'package:provider/provider.dart';

class TopList extends StatelessWidget {
  final Future future;
  const TopList({super.key, required this.future});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: Provider.of<HomeProvider>(context, listen: false).getRateMovies(),
      future: future,
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

        final rates = snapshot.data!;
        final movies = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 7 / 10,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return RatefilmWidget(
                rate: rates[index],
                movie: movies[index],
              );
            },
          ),
        );
      },
    );
  }
}
