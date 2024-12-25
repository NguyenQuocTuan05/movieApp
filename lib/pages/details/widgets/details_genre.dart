import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class DetailsGenre extends StatelessWidget {
  const DetailsGenre({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'Genre:',
              style: TextStyle(
                fontSize: 12,
                color: ColorApp.textColor,
              ),
            ),
            Text(
              ' Action, Superhero, Science Fiction, Romance, Thriller, ...',
              style: TextStyle(
                fontSize: 12,
                color: ColorApp.textColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat ',
            style: const TextStyle(
              fontSize: 12,
              color: ColorApp.textColor,
            ),
            children: [
              TextSpan(
                text: 'View More',
                style: const TextStyle(
                  fontSize: 12,
                  color: ColorApp.platformColor,
                  decoration: TextDecoration.underline,
                ),
                // Thêm hành động khi nhấn vào "View More"
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("View More clicked");
                  },
              ),
            ],
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
