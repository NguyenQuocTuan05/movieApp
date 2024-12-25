import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: ColorApp.textColor,
          ),
        ),
        const Text(
          'See all',
          style: TextStyle(
            fontSize: 14,
            color: ColorApp.platformColor,
          ),
        ),
      ],
    );
  }
}
