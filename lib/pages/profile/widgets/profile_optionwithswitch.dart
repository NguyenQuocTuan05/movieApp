import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class ProfileOptionWithSwitch extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ProfileOptionWithSwitch({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: ColorApp.textColor),
      title: Text(
        title,
        style: const TextStyle(color: ColorApp.textColor),
      ),
      trailing: Switch(
        value: value,
        activeColor: ColorApp.platformColor,
        onChanged: onChanged,
      ),
    );
  }
}
