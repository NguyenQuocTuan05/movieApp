import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class DetailsBox extends StatelessWidget {
  const DetailsBox({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: ColorApp.platformColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: ColorApp.platformColor,
        ),
      ),
    );
  }
}
