import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class ButtonWidgets extends StatelessWidget {
  const ButtonWidgets({super.key, required this.buttonText});
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: ColorApp.platformColor,
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          color: ColorApp.textColor,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
