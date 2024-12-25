import 'package:flutter/material.dart';
import 'package:movie_app/apps/configs/color_app.dart';

class SettingNation extends StatelessWidget {
  const SettingNation({super.key});
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
          Image.asset('assets/images/usa.png'),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: ColorApp.textColor,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            '+1 111 467 378 399',
            style: TextStyle(fontSize: 14, color: ColorApp.textColor),
          )
        ],
      ),
    );
  }
}
