import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/pages/details/widgets/details_box.dart';

class DetailsTitle extends StatelessWidget {
  const DetailsTitle({super.key});
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
        const Text(
          '9.8',
          style: TextStyle(
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
        const Text(
          '2022',
          style: TextStyle(
            fontSize: 14,
            color: ColorApp.textColor,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        const DetailsBox(text: '13+'),
        const SizedBox(
          width: 12,
        ),
        const DetailsBox(text: 'United States'),
        const SizedBox(
          width: 12,
        ),
        const DetailsBox(text: 'Subtitle'),
      ],
    );
  }
}
