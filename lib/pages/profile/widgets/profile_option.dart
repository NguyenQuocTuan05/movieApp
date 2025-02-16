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
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Theme.of(context).textTheme.bodyLarge!.color),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
      ),
      trailing: trailing ??
          Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).textTheme.bodyLarge!.color,
            size: 16,
          ),
      onTap: onTap,
    );
  }
}
