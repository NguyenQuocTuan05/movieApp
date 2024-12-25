import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class PlayWidgets extends StatelessWidget {
  const PlayWidgets({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: ColorApp.platformColor,
        ),
        borderRadius: BorderRadius.circular(
          100,
        ),
        color: ColorApp.platformColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/play.png',
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'Play',
            style: TextStyle(
              fontSize: 14,
              color: ColorApp.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
