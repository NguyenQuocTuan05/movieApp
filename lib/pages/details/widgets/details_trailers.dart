import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/helper/video_film.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/model/video.dart';

class DetailsTrailers extends StatelessWidget {
  const DetailsTrailers({
    super.key,
    required this.video,
  });
  final List<Video> video;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: video.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        final videos = video[index];
        return AspectRatio(
          aspectRatio: 3 / 1,
          child: GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, RoutersName.playPages, arguments: {
              'videoFilm': VideoFilm(id: videos.key!),
              'name': videos.name,
            }),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2.0, color: ColorApp.borderColor),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    child: Image.network(
                      VideoFilm(id: videos.key!).getImageVideoUrl(),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        videos.name ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
