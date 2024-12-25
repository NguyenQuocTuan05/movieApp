import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: ColorApp.textColor),
      title: Text(
        title,
        style: const TextStyle(color: ColorApp.textColor),
      ),
      trailing: trailing ??
          const Icon(Icons.arrow_forward_ios,
              color: ColorApp.textColor, size: 16),
      onTap: onTap,
    );
  }
}
