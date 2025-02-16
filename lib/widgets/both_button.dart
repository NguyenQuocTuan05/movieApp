import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class BothButton extends StatelessWidget {
  const BothButton({
    super.key,
    required this.textFirst,
    required this.textSecond,
    required this.onTapFirst,
    required this.onTapSecond,
  });
  final String textFirst;
  final String textSecond;
  final VoidCallback onTapFirst;
  final VoidCallback onTapSecond;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTapFirst,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: ColorApp.borderColor,
              ),
              child: Text(
                textFirst,
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorApp.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: GestureDetector(
            onTap: onTapSecond,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: ColorApp.platformColor,
              ),
              child: Text(
                textSecond,
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorApp.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
