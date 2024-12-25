import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/rate.dart';

class RatefilmWidget extends StatelessWidget {
  final Rate rate;
  final Movie movie;

  const RatefilmWidget({super.key, required this.rate, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(rate.getPosterUrlRate()),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: ColorApp.platformColor,
            ),
            child: Text(
              rate.vote_average?.toStringAsFixed(1) ?? 'N/A',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
