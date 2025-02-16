import 'package:flutter/material.dart';
import 'package:movie_app/provider/mylist_provider.dart';
import 'package:provider/provider.dart';

class DetailsFilm extends StatelessWidget {
  final String names;
  final int id;
  const DetailsFilm({
    super.key,
    required this.names,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            names,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Consumer<MylistProvider>(
          builder: (context, provider, child) {
            return GestureDetector(
              onTap: () {
                provider.handleSaveList(id, names, context);
              },
              child: Image.asset(
                'assets/images/bookmark.png',
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            );
          },
        ),
        const SizedBox(
          width: 20,
        ),
        Image.asset(
          'assets/images/send.png',
          color: Theme.of(context).textTheme.bodyLarge!.color,
        ),
      ],
    );
  }
}
