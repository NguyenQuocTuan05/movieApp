import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class MylistEmpty extends StatelessWidget {
  const MylistEmpty({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
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
          Text(
            "It seems that you haven't added \nany movies to the list",
            style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyMedium?.color),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
