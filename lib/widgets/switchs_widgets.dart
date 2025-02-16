import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class SwitchsWidgets extends StatelessWidget {
  const SwitchsWidgets(
      {super.key, required this.title, required this.value, this.onChanged});
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 16,
            ),
          ),
        ),
        Switch(
          activeColor: ColorApp.platformColor,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
