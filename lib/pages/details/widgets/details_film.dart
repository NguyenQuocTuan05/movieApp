import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class DetailsFilm extends StatelessWidget {
  const DetailsFilm({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Avatar: The Way of Water',
            style: TextStyle(
              fontSize: 24,
              color: ColorApp.textColor,
            ),
          ),
        ),
        Image.asset(
          'assets/images/bookmark.png',
        ),
        const SizedBox(
          width: 20,
        ),
        Image.asset(
          'assets/images/send.png',
        ),
      ],
    );
  }
}
