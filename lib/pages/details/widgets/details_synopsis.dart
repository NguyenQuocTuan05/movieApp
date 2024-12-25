import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class DetailsSynopsis extends StatelessWidget {
  const DetailsSynopsis({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8 / 7,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/introduce.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Icon(
                  Icons.arrow_back,
                  color: ColorApp.textColor,
                  size: 28,
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/video.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
