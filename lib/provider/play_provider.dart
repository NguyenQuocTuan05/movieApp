import 'package:flutter/material.dart';
import 'package:movie_app/apps/helper/video_film.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayProvider extends ChangeNotifier {
  YoutubePlayerController? _youtubeController;

  YoutubePlayerController? get youtubeController => _youtubeController;

  void initializeYoutubeController(VideoFilm videoFilm) {
    _youtubeController = YoutubePlayerController(
      initialVideoId: videoFilm.id,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void disposeYoutubeController() {
    _youtubeController?.dispose();
    _youtubeController = null;
    notifyListeners();
  }
}
