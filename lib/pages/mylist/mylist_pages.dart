import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/widgets/appbar_widgets.dart';

class MylistPages extends StatelessWidget {
  const MylistPages({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundColor,
      appBar: const AppbarWidgets(title: 'My List'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/note.png',
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 44,
            ),
            const Text(
              'Your List is Empty',
              style: TextStyle(
                  fontSize: 24,
                  color: ColorApp.platformColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "It seems that you haven't added any movies to the list",
              style: TextStyle(fontSize: 18, color: ColorApp.textColor),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
