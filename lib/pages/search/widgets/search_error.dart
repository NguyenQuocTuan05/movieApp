import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class SearchError extends StatelessWidget {
  const SearchError({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/error.png',
            ),
            const SizedBox(
              height: 44,
            ),
            const Text(
              'Not Found',
              style: TextStyle(
                fontSize: 24,
                color: ColorApp.platformColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Sorry, the keyword you entered could not be found. Try to check again or search with other keywords.',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 44,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back to home',
                style: TextStyle(
                  fontSize: 24,
                  color: ColorApp.platformColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
