import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/apps/routers/routers_name.dart';
import 'package:movie_app/pages/search/widgets/search_line.dart';
import 'package:movie_app/widgets/both_button.dart';

class ProfileLogout extends StatelessWidget {
  const ProfileLogout({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Log Out',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorApp.platformColor,
            ),
          ),
          const SizedBox(height: 24),
          const SearchLine(),
          const SizedBox(height: 24),
          Text(
            'Are you sure you want to log out?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          BothButton(
            textFirst: 'Cancel',
            textSecond: 'Yes, Logout',
            onTapFirst: () => Navigator.pop(context),
            onTapSecond: () => Navigator.pushNamedAndRemoveUntil(
                context, RoutersName.welcomePages, (route) => false),
          ),
        ],
      ),
    );
  }
}
