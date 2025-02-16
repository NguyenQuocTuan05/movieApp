import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';
import 'package:movie_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ProfileOptionWithSwitch extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileOptionWithSwitch({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Theme.of(context).textTheme.bodyLarge?.color),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
      ),
      trailing: Consumer<ThemeProvider>(
        builder: (context, provider, build) {
          return Switch(
            value: provider.isDarkMode,
            activeColor: ColorApp.platformColor,
            onChanged: (value) {
              provider.toggleTheme();
            },
          );
        },
      ),
    );
  }
}
