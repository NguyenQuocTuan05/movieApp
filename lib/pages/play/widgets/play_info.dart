import 'package:flutter/material.dart';

class PlayInfo extends StatelessWidget {
  const PlayInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.black.withOpacity(0.5),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back, color: Colors.white),
          Text(
            'Stranger Things 4: Episode 1',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
    );
  }
}
