import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/details/widgets/details_box.dart';

class DetailsTitle extends StatelessWidget {
  final String rating;
  final int? year;
  final String? country;
  const DetailsTitle({
    super.key,
    required this.rating,
    required this.year,
    required this.country,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/star.png',
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          rating,
          style: const TextStyle(
            fontSize: 12,
            color: ColorApp.platformColor,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Icon(
          Icons.chevron_right,
          color: ColorApp.platformColor,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          year.toString(),
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        const DetailsBox(text: '13+'),
        const SizedBox(
          width: 12,
        ),
        DetailsBox(
          text: country ?? '',
        ),
        const SizedBox(
          width: 12,
        ),
        const DetailsBox(text: 'Subtitle'),
      ],
    );
  }
}
