import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class HomeTitle extends StatelessWidget {
  final VoidCallback onTap;
  const HomeTitle({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            // color: ColorApp.textColor,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: const Text(
            'See all',
            style: TextStyle(
              fontSize: 14,
              color: ColorApp.platformColor,
            ),
          ),
        ),
      ],
    );
  }
}
