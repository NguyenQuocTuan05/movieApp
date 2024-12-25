import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayControls extends StatefulWidget {
  final VideoPlayerController controller;

  const PlayControls({super.key, required this.controller});

  @override
  State<PlayControls> createState() => _PlayControlsState();
}

class _PlayControlsState extends State<PlayControls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Column(
        children: [
          // Seekbar
          Slider(
            value: widget.controller.value.position.inSeconds.toDouble(),
            max: widget.controller.value.duration.inSeconds.toDouble(),
            onChanged: (value) {
              setState(() {
                widget.controller.seekTo(Duration(seconds: value.toInt()));
              });
            },
            activeColor: Colors.red,
            inactiveColor: Colors.white,
          ),

          // Control Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.volume_up, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  widget.controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    widget.controller.value.isPlaying
                        ? widget.controller.pause()
                        : widget.controller.play();
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.fullscreen, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
