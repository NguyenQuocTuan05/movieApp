import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class PrivilegesPremium extends StatelessWidget {
  final String title;
  const PrivilegesPremium({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const Icon(
              Icons.check,
              color: ColorApp.platformColor,
              size: 32,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
