import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class ChooseWidgets extends StatelessWidget {
  const ChooseWidgets({
    super.key,
    required this.choose,
    required this.question,
  });
  final String question;
  final String choose;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 14,
            color: ColorApp.textColor,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          choose,
          style: const TextStyle(
            fontSize: 14,
            color: ColorApp.platformColor,
          ),
        ),
      ],
    );
  }
}
