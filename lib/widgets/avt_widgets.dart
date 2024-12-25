import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class AvtWidgets extends StatelessWidget {
  const AvtWidgets({super.key});
  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            'https://via.placeholder.com/150',
          ),
        ),
        CircleAvatar(
          radius: 16,
          backgroundColor: ColorApp.platformColor,
          child: Icon(Icons.edit, size: 16, color: ColorApp.backgroundColor),
        ),
      ],
    );
  }
}
