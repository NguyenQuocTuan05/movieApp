import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class ChooseWidgets extends StatelessWidget {
  const ChooseWidgets({
    super.key,
    required this.choose,
    required this.question,
    required this.onTap,
  });
  final String question;
  final String choose;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            choose,
            style: const TextStyle(
              fontSize: 14,
              color: ColorApp.platformColor,
            ),
          ),
        ),
      ],
    );
  }
}
