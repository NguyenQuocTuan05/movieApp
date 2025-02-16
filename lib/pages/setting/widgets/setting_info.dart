import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class SettingInfo extends StatelessWidget {
  const SettingInfo({
    super.key,
    required this.text,
    this.icon,
  });

  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorApp.borderColor,
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: ColorApp.textColor,
            ),
          ),
          const Spacer(),
          if (icon != null)
            Icon(
              icon,
              color: ColorApp.textColor,
            ),
        ],
      ),
    );
  }
}
