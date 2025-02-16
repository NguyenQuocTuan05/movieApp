import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({super.key, required this.text, required this.price});
  final String text;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).textTheme.bodyLarge?.color),
        ),
        const Spacer(),
        Text(
          price,
          style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
