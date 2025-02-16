import 'package:flutter/material.dart';
import 'package:movie_app/provider/play_provider.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayYoutube extends StatelessWidget {
  const PlayYoutube({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayProvider>(
      builder: (context, playProvider, child) {
        final controller = playProvider.youtubeController;
        if (controller == null) {
          return const CircularProgressIndicator();
        }
        return YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          progressColors: const ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.redAccent,
          ),
        );
      },
    );
  }
}
