import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/helper/image_film.dart';

class DetailsSynopsis extends StatelessWidget {
  final String posterPath;
  const DetailsSynopsis({super.key, required this.posterPath});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 8 / 7,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          image: DecorationImage(
            image:
                NetworkImage(ImageFilm(poster_path: posterPath).getPosterUrl()),
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: ColorApp.platformColor,
                    size: 28,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/video.png',
                  color: ColorApp.platformColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
