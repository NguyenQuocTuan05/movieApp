import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class LineWidgets extends StatelessWidget {
  const LineWidgets({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorApp.borderColor,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorApp.borderColor,
            ),
          ),
        ),
      ],
    );
  }
}
