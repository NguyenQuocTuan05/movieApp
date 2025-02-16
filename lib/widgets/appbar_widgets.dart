import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class AppbarWidgets extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearchIcon;
  final VoidCallback? onTap;
  const AppbarWidgets({
    super.key,
    required this.title,
    this.showSearchIcon = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          color: ColorApp.platformColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        if (showSearchIcon)
          GestureDetector(
            onTap: onTap,
            child: Image.asset(
              'assets/images/search.png',
              height: 24,
              width: 24,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        if (showSearchIcon)
          const SizedBox(
            width: 24,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
