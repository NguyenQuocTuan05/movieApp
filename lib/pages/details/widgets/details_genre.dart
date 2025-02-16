import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class DetailsGenre extends StatefulWidget {
  final String? genres;
  final String overview;
  const DetailsGenre({
    super.key,
    required this.genres,
    required this.overview,
  });

  @override
  State<DetailsGenre> createState() => _DetailsGenreState();
}

class _DetailsGenreState extends State<DetailsGenre> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Genre: ',
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
            Expanded(
              child: Text(
                widget.genres ?? '',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            text: isExpanded
                ? widget.overview
                : widget.overview.length > 200
                    ? widget.overview.substring(0, 200)
                    : widget.overview,
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            children: [
              if (!isExpanded && widget.overview.length > 200)
                TextSpan(
                  text: ' View More',
                  style: const TextStyle(
                    fontSize: 12,
                    color: ColorApp.platformColor,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                ),
            ],
          ),
          maxLines: isExpanded ? null : 3,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
