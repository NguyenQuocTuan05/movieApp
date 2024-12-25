import 'package:flutter/material.dart';
import 'package:movie_app/pages/play/widgets/play_controls.dart';
import 'package:movie_app/pages/play/widgets/play_info.dart';
import 'package:video_player/video_player.dart';

class PlayPages extends StatefulWidget {
  const PlayPages({super.key});

  @override
  State<PlayPages> createState() => _PlayPagesState();
}

class _PlayPagesState extends State<PlayPages> {
  late VideoPlayerController _controller;
  bool _showControls = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Video Player
          GestureDetector(
            onTap: () {
              setState(() {
                _showControls = !_showControls;
              });
            },
            child: Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : const CircularProgressIndicator(),
            ),
          ),

          // Overlay Controls
          if (_showControls)
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top Bar
                  const PlayInfo(),

                  // Bottom Controls
                  PlayControls(controller: _controller)
                ],
              ),
            ),
        ],
      ),
    );
  }
}
